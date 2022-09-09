Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8196E5B2D55
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 06:22:33 +0200 (CEST)
Received: from localhost ([::1]:52982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWVXD-0006cM-RP
	for lists+qemu-devel@lfdr.de; Fri, 09 Sep 2022 00:22:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oWVVj-0005GK-Ub
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 00:21:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oWVVg-0003dM-Na
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 00:20:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662697255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nmdjMahCXJvv9JblBHCSVmtOKR/Z1cByKzshcYPsGfA=;
 b=BIJIfAfs5Zzz/YW51cPQxuGmDKtom6xeFcIhEHROSZSr0O5ZAAyRpM9yT8ooVzjLPIityi
 +25Pw3proHdzwaqBzc8ZxXGI5uaXU1LTXiaiOWY76F9QI/J9qsIpEdP63J2gE6Do6c4M8N
 zMxxmxbbqZWl2KAURJ9sPYXPs6u3drc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-457-iKgpstaIMre_xm7ZQt56ig-1; Fri, 09 Sep 2022 00:20:53 -0400
X-MC-Unique: iKgpstaIMre_xm7ZQt56ig-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3DAB31C04B52;
 Fri,  9 Sep 2022 04:20:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6AFE44011A3E;
 Fri,  9 Sep 2022 04:20:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EC17621E6900; Fri,  9 Sep 2022 06:20:50 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Claudio Fontana <cfontana@suse.de>,  Gerd Hoffmann <kraxel@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,  Christian
 Schoenebeck
 <qemu_oss@crudebyte.com>,  Akihiko Odaki <akihiko.odaki@gmail.com>,
 Volker =?utf-8?Q?R=C3=BCmelin?= <vr_qemu@t-online.de>,  qemu-devel
 <qemu-devel@nongnu.org>,  Richard Henderson
 <richard.henderson@linaro.org>,  Daniel P . =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH v3] audio: add help option for -audio and -audiodev
References: <20220908093936.19280-1-pbonzini@redhat.com>
 <67f82e6b-683d-564f-aa9f-a9aaaafd0382@suse.de>
 <CABgObfaQuw20OB2whQMg1kp0Pau370zs3NyUP4SMN1GkFUvLpA@mail.gmail.com>
Date: Fri, 09 Sep 2022 06:20:50 +0200
In-Reply-To: <CABgObfaQuw20OB2whQMg1kp0Pau370zs3NyUP4SMN1GkFUvLpA@mail.gmail.com>
 (Paolo Bonzini's message of "Fri, 9 Sep 2022 00:05:36 +0200")
Message-ID: <87leqt18m5.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Paolo Bonzini <pbonzini@redhat.com> writes:

> No, there's nothing yet.

What about QOM introspection?  Oh, we're not using QOM there.  Would
QOMification be desirable?


