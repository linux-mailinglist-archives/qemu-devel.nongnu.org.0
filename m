Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B6D5E64AA
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 16:06:18 +0200 (CEST)
Received: from localhost ([::1]:59024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obMqH-0002rz-2Y
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 10:06:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1obM8C-0001UZ-0h
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 09:20:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1obM87-0004N6-2d
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 09:20:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663852837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JnzZZ5YrkMcVL9ZVWm6CULnaHSqs7gH4CpO1qGUvMgc=;
 b=OSUuf7vlT6oYJPtAHGUIq5U3slFPSgSwc/AZDwUpeRvRmPhtn3vRI//S5uh4R6OarqL9rn
 1ePAZjHOYhb2jsdUd/rPafCzOI/MPSq/A0FhxSoUD5k5BKFeEwl8HXFYbkEYRyJ/yg2OaD
 7IOO/8PkmDifKGnh1iw964MfcaXGdmk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-390-VbcXEKG5O2iy4uxX3Y8p9Q-1; Thu, 22 Sep 2022 09:20:34 -0400
X-MC-Unique: VbcXEKG5O2iy4uxX3Y8p9Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 39C3D101A52A;
 Thu, 22 Sep 2022 13:20:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ED1A040C6EC4;
 Thu, 22 Sep 2022 13:20:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 00D6021E6900; Thu, 22 Sep 2022 15:20:29 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Cc: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>,  Paolo Bonzini <pbonzini@redhat.com>,  Richard
 Henderson <richard.henderson@linaro.org>,  Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org,  dinechin@redhat.com,  Gerd Hoffmann
 <kraxel@redhat.com>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>
Subject: Re: [PATCH v4 2/3] module: add Error arguments to module_load_one
 and module_load_qom_one
References: <20220908183012.17667-1-cfontana@suse.de>
 <20220908183012.17667-3-cfontana@suse.de>
 <877d23ekj0.fsf@pond.sub.org>
 <76775f64-e49a-1c3c-0d73-10d93eff34e4@amsat.org>
 <87y1ucdirx.fsf@pond.sub.org>
 <cc2c5e14-f0a0-4415-9fe1-d7811ee27850@suse.de>
 <878rmc54cw.fsf@pond.sub.org> <Yywcs7CpKDxahOSM@redhat.com>
 <87leqb4ul9.fsf@pond.sub.org>
 <5f5921fe-6d4f-490b-4328-702a45973bbc@suse.de>
 <87bkr7mvgr.fsf@pond.sub.org>
 <4a656f0f-1497-5569-e562-f537b115daf3@suse.de>
Date: Thu, 22 Sep 2022 15:20:29 +0200
In-Reply-To: <4a656f0f-1497-5569-e562-f537b115daf3@suse.de> (Claudio Fontana's
 message of "Thu, 22 Sep 2022 14:45:40 +0200")
Message-ID: <87r103lf4y.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Claudio Fontana <cfontana@suse.de> writes:

[...]

> I think it would be better to completely make the return value separate from the Error,
> and really treat Error as an exception and not mix it up with the regular execution,
>
> but if it is the general consensus that I am the only one seeing this conflation problem we can model it this way too.

It's a matter of language pragmatics.  In Java, you throw an exception
on error.  In C, you return an error value.

Trying to emulate exceptions in C might be even more unadvisable than
trying to avoid them in Java.  Best to work with the language, not
against it.

Trouble is the error values we can conveniently return in C can't convey
enough information.  So we use Error for that.  Just like GLib uses
GError.

More modern languages do "return error value" much better than C can.  C
is what it is.

We could certainly argue how to do better than we do now in QEMU's C
code.  However, the Error API is used all over the place, which makes
changing it expensive.  "Rethinking the whole Error API" (your words)
would have to generate benefits worth this expense.  Which seems
unlikely.

[...]


