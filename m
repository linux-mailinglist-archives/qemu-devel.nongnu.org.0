Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BD86101BA
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 21:34:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7m3-0002Go-D5; Thu, 27 Oct 2022 14:38:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7hx-0004sU-Uc
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:34:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7hu-0002tq-QV
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:34:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666895662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kP1xn8MmjI2abeEJ4unarbJDjyetTBtgYhs+d/kgzi8=;
 b=JnlkcWO4oyWSkAIHYaCBu7tES9mmQO9b5OAShCCi5TxliPj5Si6Wot0fvcb2WEe+YipIp1
 8E9PpvwZ5gBeCfHdx3WuAOm5bZJ8id832FqpnMVnKocs3zXJjT1GcGc6J0mBOlDeIeOyEl
 lhp0NCYE/6x4mrRiIrwSqpni6+wuw/U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-568--LHvKYbXOy6_qOhwjZEUDA-1; Thu, 27 Oct 2022 14:34:17 -0400
X-MC-Unique: -LHvKYbXOy6_qOhwjZEUDA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D216B101A5DE;
 Thu, 27 Oct 2022 18:34:13 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B6891415117;
 Thu, 27 Oct 2022 18:34:12 +0000 (UTC)
Date: Thu, 27 Oct 2022 20:34:11 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 dinechin@redhat.com, Gerd Hoffmann <kraxel@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v9 0/5] improve error handling for module load
Message-ID: <Y1rPI2sXcxjbVIbd@redhat.com>
References: <20220929093035.4231-1-cfontana@suse.de>
 <3568bac0-1b64-d096-b78a-29f628a70448@suse.de>
 <b68f4730-be61-b635-057e-270f3f74f63b@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b68f4730-be61-b635-057e-270f3f74f63b@suse.de>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 27.10.2022 um 16:52 hat Claudio Fontana geschrieben:
> A ping on this one, is there anything more that needs to be urgently
> addressed before it can be queued for inclusion?  This is currently
> creating problems for upstream kubevirt, due to the error handling not
> properly reporting permissions errors on module file access.

What is the right tree to take this one?

get_maintainers.pl doesn't show anything for module.[ch], which might be
why nobody feels responsible for merging this.

Kevin


