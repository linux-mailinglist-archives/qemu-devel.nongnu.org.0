Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CAA4CF2CA
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 08:44:01 +0100 (CET)
Received: from localhost ([::1]:57290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR82C-0008Nu-QV
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 02:44:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nR7xw-0006ql-Rq
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 02:39:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nR7xu-00063X-2s
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 02:39:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646638772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VOPb3Gg9+sXHDDWjpJTYKpaa4k8o4cscY+rOAYVVIeQ=;
 b=Q6KKyO4CirkyW5GF/oYv6hMeiXHN6c1FoQpDCwGxocf7SXYD+aeXtnqral4mtpTdG/IBYx
 jjGbAqHDxj6qNrwXm5GcskqxDAnCVl5rFouD+WxjyCx8MQvSs1rzk2DfCfPGpPLKkcp+SV
 C5fE2gj/+na/WsD8hTmnivQG3BlspD8=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-400-jXfmL3TvPzi3DLOc7DpCSA-1; Mon, 07 Mar 2022 02:39:29 -0500
X-MC-Unique: jXfmL3TvPzi3DLOc7DpCSA-1
Received: by mail-pf1-f197.google.com with SMTP id
 h128-20020a625386000000b004f10a219a98so9979156pfb.0
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 23:39:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=VOPb3Gg9+sXHDDWjpJTYKpaa4k8o4cscY+rOAYVVIeQ=;
 b=4Fak6+uUZ8fhVp/UexoULDPCtSLpNVMVQyHDUMJ6z0AbjRbYn4nJM0TkBPGZF4p0Fr
 yiTnL4EtVo5IBwfb18gbGW5GNPyjIoXkOxlTSzCwc1J70Wbw0avKKQY/pBMNbIsEcupL
 xQHt9yAnktgRbq+ggZQ6DQoRP5vcW3W/J4DFqvDyf3aqocVrELP3mXR8F7WL5PcWATar
 aDbdVMd+6QJz1SHGjoebZ/rfrUwfFTfad7xc2u9/R+ys6yw5joeEdj4EAxwGkOqXm/Af
 ykJrJdHy5LogyPG8DqAgU/MuvxyqTrB8YkjN110n5NKfvs6wJ0yNypFJJCEpBJcE10K+
 1xlA==
X-Gm-Message-State: AOAM532yN/eJFUgVZQqeuNhGfMIfbrBpH6E8J99oR9sPQvNXfdXBNN+Q
 i62CKd4m8YpE81d8Up9HBqA8dBU0/MM7z59Q19K/grDBqVdAIDXAbcdP2OuTdC2PYKJTzGeyiZU
 zHM1jkuc2/so3/yU=
X-Received: by 2002:a17:902:7c0e:b0:151:6f68:6a46 with SMTP id
 x14-20020a1709027c0e00b001516f686a46mr10503779pll.62.1646638767989; 
 Sun, 06 Mar 2022 23:39:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyvY+45ZImwdWDbHb/hIXGch6uwZtThQaMhRFhFUjAgTuCcO5axSOYu5qpxro8bPdu06bXWQg==
X-Received: by 2002:a17:902:7c0e:b0:151:6f68:6a46 with SMTP id
 x14-20020a1709027c0e00b001516f686a46mr10503757pll.62.1646638767697; 
 Sun, 06 Mar 2022 23:39:27 -0800 (PST)
Received: from xz-m1.local ([94.177.118.47]) by smtp.gmail.com with ESMTPSA id
 o5-20020a056a00214500b004bd7036b50asm14527062pfk.172.2022.03.06.23.39.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 23:39:27 -0800 (PST)
Date: Mon, 7 Mar 2022 15:39:22 +0800
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH 11/18] tests: expand the migration precopy helper to
 support failures
Message-ID: <YiW2qjiy+QQHlR6o@xz-m1.local>
References: <20220302174932.2692378-1-berrange@redhat.com>
 <20220302174932.2692378-12-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220302174932.2692378-12-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 02, 2022 at 05:49:25PM +0000, Daniel P. Berrangé wrote:
> The migration precopy testing helper function always expects the
> migration to run to a completion state. There will be test scenarios
> for TLS where expect either the client or server to fail the migration.
> This expands the helper to cope with these scenarios.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  tests/qtest/migration-test.c | 47 +++++++++++++++++++++++++++++-------
>  1 file changed, 38 insertions(+), 9 deletions(-)
> 
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index 2082c58e8b..e40b408988 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -827,17 +827,32 @@ typedef void (*TestMigrateFinishHook)(QTestState *from,
>   * @connect_uri: the URI for the src QEMU to connect to
>   * @start_hook: (optional) callback to run at start to set migration parameters
>   * @finish_hook: (optional) callback to run at finish to cleanup
> + * @expect_fail: true if we expect migration to fail
> + * @dst_quit: true if we expect the dst QEMU to quit with an
> + *            abnormal exit status on failure

"dst_quit" sounds a bit confusing to me, as setting dst_quit=false seems to
mean "dest qemu should not quit" but it's actually for checking an abnormal
quit only.

Rename may work. Or, IMHO it's nicer if we could merge the two parameters:

  @expected_result: What is the expectation of this migration test

  typedef enum {
    /* This test should succeed, the default */
    MIG_TEST_SUCCEED = 0,
    /* This test should fail, dest qemu should keep alive */
    MIG_TEST_FAIL,
    /* This test should fail, dest qemu should fail with abnormal status */
    MIG_TEST_FAIL_DEST_QUIT_ERR,
  };

Because fundamentally the two parameters are correlated, e.g. there is no
combination of expect_fail==false && dst_quit==true.

No strong opinion, though.

Thanks,

-- 
Peter Xu


