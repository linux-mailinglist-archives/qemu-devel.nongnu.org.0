Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFA75ACB11
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 08:36:12 +0200 (CEST)
Received: from localhost ([::1]:41610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oV5iN-0006Yi-FE
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 02:36:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oV5cR-0004hZ-L5
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 02:30:03 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:33584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oV5cQ-0003hN-5L
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 02:30:03 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 t6-20020a17090a950600b0020063f8f964so1303090pjo.0
 for <qemu-devel@nongnu.org>; Sun, 04 Sep 2022 23:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:from:to:cc:subject:date;
 bh=KeaA0v+wTsqfTwQarrjYTFSx/5xvTPmVbc1a9qjXnv4=;
 b=QELuYIhR7m1ka3n9ldk4DUZUZG1hupwpb/Ioc4sRjuZt7gwxQRWxpcCekZ7OG1ybyX
 rEruMiOKXW/53FVtGRqObpoUsCWbdnPe1psERCgL/55uek+oX5qvO/L873WvLxEvSYlW
 kwLSmhaAhjUbCZBlhBLgYhOBuv/gLtfHD4bV7tmfiZ3p4E698Pyphm4HvPWFCkKpJY0i
 Hd3P4MaU9JUoki0Me2OjtAPQohL1Dk/DzBmVYa6IcCDqOk2/STnyRLz1Air+1BQ9nuUe
 N093V0COoQbgysV3awJCiWG6ge3CONyhlCPuDxo+JMSSKFLx1WiFXNY3epA+5kXOINTD
 aS3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date;
 bh=KeaA0v+wTsqfTwQarrjYTFSx/5xvTPmVbc1a9qjXnv4=;
 b=Yj7Tep5lIe/+eEWt0SSkSHvrgYJ5sK9BPgicy+50UY63fAMBhHCCMFD4yht7++Lnnv
 POebonJUdYKI7frXXU0guQz11M905Nzs5s/8qt26lUngfIBtsHyVJIybtQrhz++jmq6N
 5W3ZfN9b6L65V/eWz1pzJsO2iPfMYmeiI/+myPoLNb7hIpyvbfR1vx6g/1gdQnVHKZfk
 Yw/h8ZKWH+Q9u9jdtkDMHk9fRoa3gVpLj4boroiLj9R6MWhGjq5SwAVZ0d3v2aMuGF7h
 tM4YjsUMASAhMRBUm7maA09IMqZ80ljiuFB6pWNTpmUZSKE631xYcfiqElQe21/OyaHV
 yOtw==
X-Gm-Message-State: ACgBeo3FXmKvEgBJ+YhevU42QIMv4BE7yqfhrBAPBY02Y0AzLdhmIhn3
 Nq2PxCR6aN83TEMo5CemZBmEDQ==
X-Google-Smtp-Source: AA6agR4X7jNiFsBcEpPuz8LKkANyshc7g1GgW5svPMauqBbo81dAs2/YwV0l+l8EqnICrMNzILS1Ow==
X-Received: by 2002:a17:90a:ba01:b0:200:8769:1c34 with SMTP id
 s1-20020a17090aba0100b0020087691c34mr209144pjr.0.1662359400490; 
 Sun, 04 Sep 2022 23:30:00 -0700 (PDT)
Received: from [172.16.185.128] ([115.96.134.171])
 by smtp.googlemail.com with ESMTPSA id
 f30-20020aa79d9e000000b0053bbaab3511sm2601170pfq.172.2022.09.04.23.29.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 23:30:00 -0700 (PDT)
Date: Mon, 5 Sep 2022 11:59:28 +0530 (IST)
From: Ani Sinha <ani@anisinha.ca>
To: Juan Quintela <quintela@redhat.com>
cc: qemu-devel@nongnu.org, Bandan Das <bsd@redhat.com>, 
 Darren Kenny <darren.kenny@oracle.com>, Alexander Bulekov <alxndr@bu.edu>, 
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH 4/8] tests: Only run intel-hda-tests if machine type is
 compiled in
In-Reply-To: <20220902173452.1904-5-quintela@redhat.com>
Message-ID: <26d23a43-c2e6-7e-498f-54d6c3ad7c2f@anisinha.ca>
References: <20220902173452.1904-1-quintela@redhat.com>
 <20220902173452.1904-5-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::102a;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On Fri, 2 Sep 2022, Juan Quintela wrote:

Reviewed-by: Ani Sinha <ani@anisinha.ca>

> Signed-off-by: Juan Quintela <quintela@redhat.com>

> ---
>  tests/qtest/intel-hda-test.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/tests/qtest/intel-hda-test.c b/tests/qtest/intel-hda-test.c
> index a58c98e4d1..d4a8db6fd6 100644
> --- a/tests/qtest/intel-hda-test.c
> +++ b/tests/qtest/intel-hda-test.c
> @@ -18,7 +18,7 @@
>  /* Tests only initialization so far. TODO: Replace with functional tests */
>  static void ich6_test(void)
>  {
> -    qtest_start("-device intel-hda,id=" HDA_ID CODEC_DEVICES);
> +    qtest_start("-machine pc -device intel-hda,id=" HDA_ID CODEC_DEVICES);
>      qtest_end();
>  }
>
> @@ -65,9 +65,12 @@ static void test_issue542_ich6(void)
>  int main(int argc, char **argv)
>  {
>      g_test_init(&argc, &argv, NULL);
> -    qtest_add_func("/intel-hda/ich6", ich6_test);
> -    qtest_add_func("/intel-hda/ich9", ich9_test);
> -    qtest_add_func("/intel-hda/fuzz/issue542", test_issue542_ich6);
> -
> +    if (qtest_has_machine("pc")) {
> +        qtest_add_func("/intel-hda/ich6", ich6_test);
> +    }
> +    if (qtest_has_machine("q35")) {
> +        qtest_add_func("/intel-hda/ich9", ich9_test);
> +        qtest_add_func("/intel-hda/fuzz/issue542", test_issue542_ich6);
> +    }
>      return g_test_run();
>  }
> --
> 2.37.2
>
>

