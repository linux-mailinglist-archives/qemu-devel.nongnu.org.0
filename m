Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEBF6A9DB2
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 18:29:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY9Dm-0006Kr-2x; Fri, 03 Mar 2023 12:29:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pY9Dj-00069T-5l
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:29:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pY9Dh-00078X-8W
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:29:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677864563;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TxZcOr6P2jVpTlhU+tPlVVFEuLvmqKXxk/YNRvffams=;
 b=Ufp0Xjkv3a4OMKsPbdw96ILaQ4OalzbARjfvPMJG/QCWLadVO6bF82lVbVyU1hgNBJ5r25
 bpoynSB1DkXHVeSXd+OZ1aSKPuTQR1tGpydEYLuAx+6f5f4EHRMvrxxscO2rO++IUhgt2J
 Yi+HsFbxu3PlJ5/OzJ+OIlQuklqKkYc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-252-0aOnyyTbNxWX_xt0MMXLtA-1; Fri, 03 Mar 2023 12:29:20 -0500
X-MC-Unique: 0aOnyyTbNxWX_xt0MMXLtA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 737D685A5B1;
 Fri,  3 Mar 2023 17:29:19 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D9F32166B26;
 Fri,  3 Mar 2023 17:29:17 +0000 (UTC)
Date: Fri, 3 Mar 2023 17:29:15 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Haitao Shan <hshan@google.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 1/6] Add the Android Emulator hypervisor driver (AEHD)
 accelerator.
Message-ID: <ZAIua0vjgvWljLo4@redhat.com>
References: <20230303022618.4098825-1-hshan@google.com>
 <20230303023013-mutt-send-email-mst@kernel.org>
 <aeac5ad3-6672-10b1-283d-10d950688697@linaro.org>
 <CAGD3tSw+_qiNpSX51vGb7-XMKPFQuFKxBj072BegL_A4krn3Ag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGD3tSw+_qiNpSX51vGb7-XMKPFQuFKxBj072BegL_A4krn3Ag@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Mar 03, 2023 at 09:24:16AM -0800, Haitao Shan wrote:
> On Fri, Mar 3, 2023 at 2:19 AM Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
> >
> > On 3/3/23 08:33, Michael S. Tsirkin wrote:
> > > On Thu, Mar 02, 2023 at 06:26:12PM -0800, Haitao Shan wrote:
> > >> Add the configure support for the Android Emulator hypervisor driver
> > >> accelerator. The Android Emulator hypervisor driver is a Windows
> > >> driver made by porting the KVM from kernel 4.9-rc7.
> > >>
> > >> Signed-off-by: Haitao Shan <hshan@google.com>
> > >
> > > Replying on patch 1 but it applies to the whole patchset.
> >
> > Indeed this series lacks a cover letter, which would show
> > this huge diffstat:
> Sorry. I think I made a mistake and I know being new to
> the community is not an excuse. I will correct it in future.
> I don't know if "git sendmail" can have a cover letter. So the
> cover letter was written separately. Again, I am sorry for
> that.

FWIW, I can recommend using the 'git-publish'[1] tool instead
of git sendemail.  git-publish helps to just "do the right
thing" without you needing to know the details. It will prompt
for a cover letter to be entered, include the diffstat, and
CC any maintainers related to files your patch touches. It
figures this all our from the .gitpublish file that is in the
root of the QEMU git repo.

If you want test send some mails, then just tell git-publsh to
send to yourself instead of qemu-devel.

With regards,
Daniel

[1] https://github.com/stefanha/git-publish
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


