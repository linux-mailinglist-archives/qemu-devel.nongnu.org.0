Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB9557B478
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 12:26:27 +0200 (CEST)
Received: from localhost ([::1]:42858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE6uQ-0007wK-Lm
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 06:26:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oE6sG-0006WI-Hl
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 06:24:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oE6sD-0006vR-52
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 06:24:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658312648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pz0+DFBR8KlCXFWWFfeJNYSydWiasxmVCEd63FMl9zU=;
 b=BbRCBaVNV/OXX/3s5G7h0oOQNqYzZ86JfUk20vPFiQ9Y4MgcLTobRNbPJLHVHvAj1KbiDn
 +CMOyu+Fmahd0qBtKWLnQIhMyi++KIkADb60sS4UtAmLLhCDdnrGqNreqqGB0WMXA7TRPs
 kqUR4cpMihMydBVNykuCj3P3zMDpzPA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-n4bs_ibpO7mKqFtUSSda8w-1; Wed, 20 Jul 2022 06:24:06 -0400
X-MC-Unique: n4bs_ibpO7mKqFtUSSda8w-1
Received: by mail-wm1-f72.google.com with SMTP id
 k27-20020a05600c1c9b00b003a2fee19a80so1039542wms.1
 for <qemu-devel@nongnu.org>; Wed, 20 Jul 2022 03:24:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=pz0+DFBR8KlCXFWWFfeJNYSydWiasxmVCEd63FMl9zU=;
 b=FBWIy7l+WpjR1C3/JUOxkYymZnjAbiWOe5PEh0IbFVCei4AAeN+gFMzRLdKPJ+ah5c
 yoHgZXUp0ILPwXSdA0BYnzppUhUgPR5sGo9GsRvTeax1CxcXIfU9sI0KpDHvDHXYWCMl
 0SxEgYR45k/KuQkzh3m8XzkzMG+NjFi/iP7o35cqmpenn3jhVYtlnJ3VCpGDDN4P6MRH
 EPLrnNcQyrn9WdBKMzrJ6qYHhzoqq7hIQgQpH1Gef5Lhm8AlUfcL1V9jb0HsSF1LpCy8
 4VUn3PexE1cNWrXAnj1YPsuG20BeV6t/OxlTt3qBtvUsUwhz+aud/QWEihdAtDzTrJx/
 Xq5g==
X-Gm-Message-State: AJIora9Flir1d938TsLp/AjyUBC2bQY6nJKsd1OuGF6Y2HhyjVGx8WO+
 4HQ9KElZJjPtXo0Bt60oSPP5oY/3ZGdQPvKW+y8TyjMVQSnx3su/c5nPAf4y+t+EgON4z720G2K
 dMNE5UVWcsqqRVps=
X-Received: by 2002:a05:600c:300b:b0:3a3:19dd:858c with SMTP id
 j11-20020a05600c300b00b003a319dd858cmr3245896wmh.7.1658312645790; 
 Wed, 20 Jul 2022 03:24:05 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1va+zYv4pI4IKWoVSmQY75xvVCdsIx18imFdWM90yO9R0nCVIGgG902CEoSUjT1na1B2sXkRg==
X-Received: by 2002:a05:600c:300b:b0:3a3:19dd:858c with SMTP id
 j11-20020a05600c300b00b003a319dd858cmr3245866wmh.7.1658312645501; 
 Wed, 20 Jul 2022 03:24:05 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 h24-20020adfa4d8000000b0021d83eed0e9sm15393499wrb.30.2022.07.20.03.24.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 03:24:04 -0700 (PDT)
Date: Wed, 20 Jul 2022 11:24:02 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, leobras@redhat.com, quintela@redhat.com,
 berrange@redhat.com, peterx@redhat.com, iii@linux.ibm.com,
 huangy81@chinatelecom.cn
Subject: Re: [PULL 00/29] migration queue
Message-ID: <YtfXwlfueZE34lRE@work-vm>
References: <20220719170221.576190-1-dgilbert@redhat.com>
 <CAFEAcA_+UkfoetuMeQLGGhg_7_6=rdT3O+z0M8bE0=2Zt-j-TQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_+UkfoetuMeQLGGhg_7_6=rdT3O+z0M8bE0=2Zt-j-TQ@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Tue, 19 Jul 2022 at 18:16, Dr. David Alan Gilbert (git)
> <dgilbert@redhat.com> wrote:
> >
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> >
> > The following changes since commit da7da9d5e608200ecc0749ff37be246e9cd3314f:
> >
> >   Merge tag 'pull-request-2022-07-19' of https://gitlab.com/thuth/qemu into staging (2022-07-19 13:05:06 +0100)
> >
> > are available in the Git repository at:
> >
> >   https://gitlab.com/dagrh/qemu.git tags/pull-migration-20220719c
> >
> > for you to fetch changes up to ec0345c1000b3a57b557da4c2e3f2114dd23903a:
> >
> >   migration: Avoid false-positive on non-supported scenarios for zero-copy-send (2022-07-19 17:33:22 +0100)
> >
> > ----------------------------------------------------------------
> > Migration pull 2022-07-19
> >
> >   Hyman's dirty page rate limit set
> >   Ilya's fix for zlib vs migration
> >   Peter's postcopy-preempt
> >   Cleanup from Dan
> >   zero-copy tidy ups from Leo
> >   multifd doc fix from Juan
> >
> > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> >
> > ----------------------------------------------------------------
> 
> Fails to build on some configs, eg:
> https://gitlab.com/qemu-project/qemu/-/jobs/2743059797
> https://gitlab.com/qemu-project/qemu/-/jobs/2743059743

Sorry about that; I thought I'd fixed that but I only got one of the
cases; I'll send a new version shortly.

Dave

> ../tests/qtest/migration-test.c: In function 'test_postcopy_preempt_tls_psk':
> ../tests/qtest/migration-test.c:1168:23: error:
> 'test_migrate_tls_psk_start_match' undeclared (first use in this
> function)
> 1168 | .start_hook = test_migrate_tls_psk_start_match,
> | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../tests/qtest/migration-test.c:1168:23: note: each undeclared
> identifier is reported only once for each function it appears in
> ../tests/qtest/migration-test.c:1169:24: error:
> 'test_migrate_tls_psk_finish' undeclared (first use in this function)
> 1169 | .finish_hook = test_migrate_tls_psk_finish,
> | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../tests/qtest/migration-test.c: In function 'test_postcopy_recovery_tls_psk':
> ../tests/qtest/migration-test.c:1247:23: error:
> 'test_migrate_tls_psk_start_match' undeclared (first use in this
> function)
> 1247 | .start_hook = test_migrate_tls_psk_start_match,
> | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../tests/qtest/migration-test.c:1248:24: error:
> 'test_migrate_tls_psk_finish' undeclared (first use in this function)
> 1248 | .finish_hook = test_migrate_tls_psk_finish,
> | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../tests/qtest/migration-test.c: In function 'test_postcopy_preempt_all':
> ../tests/qtest/migration-test.c:1268:23: error:
> 'test_migrate_tls_psk_start_match' undeclared (first use in this
> function)
> 1268 | .start_hook = test_migrate_tls_psk_start_match,
> | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../tests/qtest/migration-test.c:1269:24: error:
> 'test_migrate_tls_psk_finish' undeclared (first use in this function)
> 1269 | .finish_hook = test_migrate_tls_psk_finish,
> | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> At top level:
> ../tests/qtest/migration-test.c:1264:13: error:
> 'test_postcopy_preempt_all' defined but not used
> [-Werror=unused-function]
> 1264 | static void test_postcopy_preempt_all(void)
> | ^~~~~~~~~~~~~~~~~~~~~~~~~
> ../tests/qtest/migration-test.c:1244:13: error:
> 'test_postcopy_recovery_tls_psk' defined but not used
> [-Werror=unused-function]
> 1244 | static void test_postcopy_recovery_tls_psk(void)
> | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../tests/qtest/migration-test.c:1164:13: error:
> 'test_postcopy_preempt_tls_psk' defined but not used
> [-Werror=unused-function]
> 1164 | static void test_postcopy_preempt_tls_psk(void)
> | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> 
> -- PMM
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


