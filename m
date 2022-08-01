Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 606AF5867C9
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 12:44:59 +0200 (CEST)
Received: from localhost ([::1]:58586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oISuw-0003Ov-G8
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 06:44:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oISrY-000873-Mf
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 06:41:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oISrV-0005rH-Jh
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 06:41:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659350484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hMRGCraIgOer8Fq0tpAr3ja28zDWULG0LAVxGdRhgM8=;
 b=II+SzplwIheaLmXV4xo5oU86JoaKYfBrQDTN979AkhJzx+ccTIalq2HMN2ws/FiKfKBnTV
 ThllaweucQriivXXd3ANwnYv9NbcMIbCl/eIPmTmX6O9BpNV70dFshF83sULjS0Nfmc+Q8
 i5156khQ+Quhn4iuwlTyahhCvxpmUcE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-255-BXf2dLKNN4WkN38G-dQ_HA-1; Mon, 01 Aug 2022 06:41:23 -0400
X-MC-Unique: BXf2dLKNN4WkN38G-dQ_HA-1
Received: by mail-wr1-f71.google.com with SMTP id
 u17-20020adfa191000000b0021ed2209fccso2443906wru.16
 for <qemu-devel@nongnu.org>; Mon, 01 Aug 2022 03:41:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:references:from:cc:subject:in-reply-to
 :content-transfer-encoding;
 bh=hMRGCraIgOer8Fq0tpAr3ja28zDWULG0LAVxGdRhgM8=;
 b=uY04MSIth8jkqn+jdJF3xFyKtFELXDpfLQTvwh6VBH6HLfFpD/I5RgVI1sWrzEkuaH
 u/J8W4NerjAEA7wvdWzYbrm4KEPn1jb86LJURm6/J6igOmcglUhF5za5mcIHwuXPZxWz
 +ni2SHHHphguRJW7fvEx2Q8CYHHHIhgCroljxrq1NQBz0swi9El0ejt+swOUsca46EEW
 sIlJSQBNv7kP5ay9BikiimPyxg72cUT3nnnccSdFfnUF0x16Z85vE0IZsIN3Kzn/06yu
 GLMe8oBv6xCo0H8Djo6c/+OceZEHi1W/XFTFYRCnOHH7JXid2Vr4WBXeabv0iX1BwjzS
 ra7Q==
X-Gm-Message-State: ACgBeo0jd4Uh4qMFnNaLy8fi3Uxo64IMAV++P2jIq/yhcR4O5XehwDSj
 LIZRP3Z6M3a1UNe/km2Ek4YFbVYgCmICV6eFGoI7xgXtbKv9TSc/ZyQsNoDG3dm11TlVa4/PIpu
 MA4wGmwc8TXxIkN8=
X-Received: by 2002:a05:6000:4084:b0:21e:c694:80db with SMTP id
 da4-20020a056000408400b0021ec69480dbmr9223198wrb.681.1659350482397; 
 Mon, 01 Aug 2022 03:41:22 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6lroFsyEQDw7bGWmILGpTwd1GpYHx8OvegMD9qwPf8T/OGUWbWq395n6AnLjWB0UqqO/U31g==
X-Received: by 2002:a05:6000:4084:b0:21e:c694:80db with SMTP id
 da4-20020a056000408400b0021ec69480dbmr9223173wrb.681.1659350482076; 
 Mon, 01 Aug 2022 03:41:22 -0700 (PDT)
Received: from [192.168.8.104] (tmo-096-80.customers.d1-online.com.
 [80.187.96.80]) by smtp.gmail.com with ESMTPSA id
 e13-20020a5d65cd000000b0020fcaba73bcsm11518373wrw.104.2022.08.01.03.41.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Aug 2022 03:41:21 -0700 (PDT)
Message-ID: <c4ad47a1-a946-0f4e-69a2-65a6cc679a6e@redhat.com>
Date: Mon, 1 Aug 2022 12:41:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, leobras@redhat.com, quintela@redhat.com,
 berrange@redhat.com, peterx@redhat.com, iii@linux.ibm.com,
 huangy81@chinatelecom.cn
References: <20220720111926.107055-1-dgilbert@redhat.com>
 <20220720111926.107055-9-dgilbert@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>
Subject: migration test fails for aarch64 target (was: Re: [PULL 08/30] tests:
 Add dirty page rate limit test)
In-Reply-To: <20220720111926.107055-9-dgilbert@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 20/07/2022 13.19, Dr. David Alan Gilbert (git) wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> Add dirty page rate limit test if kernel support dirty ring,
> 
> The following qmp commands are covered by this test case:
> "calc-dirty-rate", "query-dirty-rate", "set-vcpu-dirty-limit",
> "cancel-vcpu-dirty-limit" and "query-vcpu-dirty-limit".
> 
> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> Acked-by: Peter Xu <peterx@redhat.com>
> Message-Id: <eed5b847a6ef0a9c02a36383dbdd7db367dd1e7e.1656177590.git.huangy81@chinatelecom.cn>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>   tests/qtest/migration-helpers.c |  22 +++
>   tests/qtest/migration-helpers.h |   2 +
>   tests/qtest/migration-test.c    | 256 ++++++++++++++++++++++++++++++++
>   3 files changed, 280 insertions(+)
[...]
> +static QTestState *dirtylimit_start_vm(void)
> +{
> +    QTestState *vm = NULL;
> +    g_autofree gchar *cmd = NULL;
> +    const char *arch = qtest_get_arch();
> +    g_autofree char *bootpath = NULL;
> +
> +    assert((strcmp(arch, "x86_64") == 0));

  Hi!

This assert triggers on my x86 laptop when I run "make check" there. More 
precisely, it triggers when qemu-system-aarch64 is getting tested:

$ QTEST_QEMU_BINARY=./qemu-system-aarch64 tests/qtest/migration-test
/aarch64/migration/bad_dest: OK
/aarch64/migration/fd_proto: OK
/aarch64/migration/validate_uuid: OK
/aarch64/migration/validate_uuid_error: OK
/aarch64/migration/validate_uuid_src_not_set: OK
/aarch64/migration/validate_uuid_dst_not_set: OK
/aarch64/migration/auto_converge: OK
/aarch64/migration/dirty_ring: OK
/aarch64/migration/vcpu_dirty_limit: migration-test: 
../../devel/qemu/tests/qtest/migration-test.c:2304: dirtylimit_start_vm: 
Assertion `(strcmp(arch, "x86_64") == 0)' failed.
Aborted (core dumped)

>   static bool kvm_dirty_ring_supported(void)
>   {
>   #if defined(__linux__) && defined(HOST_X86_64)
> @@ -2204,6 +2458,8 @@ int main(int argc, char **argv)
>       if (kvm_dirty_ring_supported()) {
>           qtest_add_func("/migration/dirty_ring",
>                          test_precopy_unix_dirty_ring);
> +        qtest_add_func("/migration/vcpu_dirty_limit",
> +                       test_vcpu_dirty_limit);
>       }

kvm_dirty_ring_supported() returns "true" if the KVM of the *host* is x86 
and has the dirty ring support, but it does *not* check the target 
architecture that is currently tested, so you also get here "true" for 
qemu-system-aarch64 being tested on a x86 host... Thus I guess 
kvm_dirty_ring_supported() needs also a check for the right target architecture?

  Thomas


