Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7743486E7
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 03:23:03 +0100 (CET)
Received: from localhost ([::1]:36060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPFe4-0002fg-Rt
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 22:22:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lPFa9-0001R1-3k; Wed, 24 Mar 2021 22:18:45 -0400
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31]:39705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lPFa6-0003FL-SS; Wed, 24 Mar 2021 22:18:44 -0400
Received: by mail-qv1-xf31.google.com with SMTP id q9so447965qvm.6;
 Wed, 24 Mar 2021 19:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6pGBmDCKNvtROlIYViTp4xjkv7wURxRN8ukttVDzpYM=;
 b=Lp7J6so8rL89dMu8HMEt7fObG10Z6XWs2AGbxt93wg5vftHXVW7rMX2xAHu3rWsiR0
 NuGff3HUzvwYXh05hORmA4jlyQhqPQmh/tWepuseAxJ8CI/QV5+MIOQrgZa2+BLZJTif
 7uTifQNqvXar35O+o+89UY823GjBTZ/zAjYRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6pGBmDCKNvtROlIYViTp4xjkv7wURxRN8ukttVDzpYM=;
 b=S5o4uTflhyHkZa20bOkIgL+gPkCQg9Zl/YmmEFr8f2YaYm3TWmjPAzQMx/BXHCsF+9
 X1pACEJiRnjUvb1rUBmOSLDNxT8EUJsoXN/lYHiGU4KYmrffwUbMcTobEv/IdVO25J24
 h5oEI+u7IAKJjgdzagtrtgL5M8ktV+JMhnfLTetIBPZQzZgYP0sS4Wgd1Q1+AJVuPfuL
 qeh38WntGrRTlKXIdrC/pukgivRDR46lda6t/z5M0kdzzpcRkJrDvkepzpXtiCsIxhR9
 ES3oU9MV1op70toUl8alLfxNRcqS1G3ju0y9L0GU+UrOKS8h8vmGsZ3QL1LicIiRPp53
 Hv8A==
X-Gm-Message-State: AOAM533kjNxLGJGQFPeDgjWf9WwO6gNm/W57Cr8vxkdbPfoqPZZk4GWg
 P4eJtOwXohoC7FUE9kNZpLzBXtpdFMapm+sX28s=
X-Google-Smtp-Source: ABdhPJx+DexruV5r5muYrb+seEHIv06d6eXNW+p/0PjnAhKUzo9oUYlHz9h5hWTnWdB2bhVvSBBzyeldRi8WYY+6m0M=
X-Received: by 2002:a05:6214:180d:: with SMTP id
 o13mr6178723qvw.10.1616638721420; 
 Wed, 24 Mar 2021 19:18:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210324223846.17407-1-klaus@linux.vnet.ibm.com>
 <20210324223846.17407-4-klaus@linux.vnet.ibm.com>
In-Reply-To: <20210324223846.17407-4-klaus@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 25 Mar 2021 02:18:29 +0000
Message-ID: <CACPK8XfHw06+o6LJsPY4X3=V69L2uT+2cZurCNxd623WT0Em+A@mail.gmail.com>
Subject: Re: [PATCH 3/3] tests: Aspeed HACE Scatter-Gather tests
To: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f31;
 envelope-from=joel.stan@gmail.com; helo=mail-qv1-xf31.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 24 Mar 2021 at 22:39, Klaus Heinrich Kiwi
<klaus@linux.vnet.ibm.com> wrote:
>
> Expand current Aspeed HACE testsuite to also include Scatter-Gather of
> sha256 and sha512 operations.
>
> Signed-off-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
> ---
>  tests/qtest/aspeed_hace-test.c | 164 ++++++++++++++++++++++++++++++---
>  1 file changed, 153 insertions(+), 11 deletions(-)
>
> diff --git a/tests/qtest/aspeed_hace-test.c b/tests/qtest/aspeed_hace-test.c
> index 2b624b6b09..ae3f963449 100644
> --- a/tests/qtest/aspeed_hace-test.c
> +++ b/tests/qtest/aspeed_hace-test.c
> @@ -35,6 +35,11 @@
>  #define HACE_HASH_DATA_LEN       0x2c
>  #define HACE_HASH_CMD            0x30
>
> +struct aspeed_sg_list {
> +        uint32_t len;
> +        uint32_t phy_addr;
> +} __attribute__ ((__packed__));
> +
>  /*
>   * Test vector is the ascii "abc"
>   *
> @@ -63,6 +68,33 @@ static const uint8_t test_result_md5[] = {
>      0x90, 0x01, 0x50, 0x98, 0x3c, 0xd2, 0x4f, 0xb0, 0xd6, 0x96, 0x3f, 0x7d,
>      0x28, 0xe1, 0x7f, 0x72};
>
> +/*
> + * The Scatter-Gather Test vector is the ascii "abc" "def" "ghi", broken
> + * into blocks of 3 characters as shown
> + *
> + * Expected results were generated using command line utitiles:
> + *
> + *  echo -n -e 'abcdefghi' | dd of=/tmp/test
> + *  for hash in sha512sum sha256sum; do $hash /tmp/test; done
> + *
> + */
> +static const uint8_t test_vector_sg1[] = {0x61, 0x62, 0x63};
> +static const uint8_t test_vector_sg2[] = {0x64, 0x65, 0x66};
> +static const uint8_t test_vector_sg3[] = {0x67, 0x68, 0x69};
> +
> +static const uint8_t test_result_sg_sha512[] = {
> +    0xf2, 0x2d, 0x51, 0xd2, 0x52, 0x92, 0xca, 0x1d, 0x0f, 0x68, 0xf6, 0x9a,
> +    0xed, 0xc7, 0x89, 0x70, 0x19, 0x30, 0x8c, 0xc9, 0xdb, 0x46, 0xef, 0xb7,
> +    0x5a, 0x03, 0xdd, 0x49, 0x4f, 0xc7, 0xf1, 0x26, 0xc0, 0x10, 0xe8, 0xad,
> +    0xe6, 0xa0, 0x0a, 0x0c, 0x1a, 0x5f, 0x1b, 0x75, 0xd8, 0x1e, 0x0e, 0xd5,
> +    0xa9, 0x3c, 0xe9, 0x8d, 0xc9, 0xb8, 0x33, 0xdb, 0x78, 0x39, 0x24, 0x7b,
> +    0x1d, 0x9c, 0x24, 0xfe};
> +
> +static const uint8_t test_result_sg_sha256[] = {
> +    0x19, 0xcc, 0x02, 0xf2, 0x6d, 0xf4, 0x3c, 0xc5, 0x71, 0xbc, 0x9e, 0xd7,
> +    0xb0, 0xc4, 0xd2, 0x92, 0x24, 0xa3, 0xec, 0x22, 0x95, 0x29, 0x22, 0x17,
> +    0x25, 0xef, 0x76, 0xd0, 0x21, 0xc8, 0x32, 0x6f};
> +
>
>  static void write_regs(QTestState *s, uint32_t base, uint32_t src,
>                         uint32_t length, uint32_t out, uint32_t method)
> @@ -167,28 +199,124 @@ static void test_sha512(const char *machine, const uint32_t base,
>                      test_result_sha512, sizeof(digest));
>  }
>
> +static void test_sha256_sg(const char *machine, const uint32_t base,
> +                        const uint32_t src_addr)
> +{
> +    QTestState *s = qtest_init(machine);
> +
> +    const uint32_t src_addr_1 = src_addr + 0x1000000;
> +    const uint32_t src_addr_2 = src_addr + 0x2000000;
> +    const uint32_t src_addr_3 = src_addr + 0x3000000;
> +    const uint32_t digest_addr = src_addr + 0x4000000;
> +    uint8_t digest[32] = {0};
> +    struct aspeed_sg_list array[] = {
> +            { sizeof(test_vector_sg1),              src_addr_1},
> +            { sizeof(test_vector_sg2),              src_addr_2},
> +            { sizeof(test_vector_sg3) | 1u << 31,   src_addr_3},

These sizeofs are always going to be 3.

I assume 1 << 31 is to indicate the final entry? Perhaps add a define for it.

> +        };
> +
> +    /* Check engine is idle, no busy or irq bits set */
> +    g_assert_cmphex(qtest_readl(s, base + HACE_STS), ==, 0);
> +
> +    /* Write test vector into memory */
> +    qtest_memwrite(s, src_addr_1, test_vector_sg1, sizeof(test_vector_sg1));
> +    qtest_memwrite(s, src_addr_2, test_vector_sg2, sizeof(test_vector_sg2));
> +    qtest_memwrite(s, src_addr_3, test_vector_sg3, sizeof(test_vector_sg3));

It would simplify your test case if you wrote the test vector to the
one memory location.

> +    qtest_memwrite(s, src_addr, array, sizeof(array));
> +
> +    write_regs(s, base, src_addr,
> +               (sizeof(test_vector_sg1)
> +                + sizeof(test_vector_sg2)
> +                + sizeof(test_vector_sg3)),
> +               digest_addr, HACE_ALGO_SHA256 | HACE_SG_EN);
> +
> +    /* Check hash IRQ status is asserted */
> +    g_assert_cmphex(qtest_readl(s, base + HACE_STS), ==, 0x00000200);
> +
> +    /* Clear IRQ status and check status is deasserted */
> +    qtest_writel(s, base + HACE_STS, 0x00000200);
> +    g_assert_cmphex(qtest_readl(s, base + HACE_STS), ==, 0);
> +
> +    /* Read computed digest from memory */
> +    qtest_memread(s, digest_addr, digest, sizeof(digest));
> +
> +    /* Check result of computation */
> +    g_assert_cmpmem(digest, sizeof(digest),
> +                    test_result_sg_sha256, sizeof(digest));
> +}
> +


>  struct masks {
> -    uint32_t src;
> +    uint32_t src_direct;

You could leave this one the same.

> +    uint32_t src_sg;

You add this, but haven't written a new test to use it.

>      uint32_t dest;
>      uint32_t len;
>  };
>
>  static const struct masks ast2600_masks = {
> -    .src  = 0x7fffffff,
> -    .dest = 0x7ffffff8,
> -    .len  = 0x0fffffff,
> +    .src_direct  = 0x7fffffff,
> +    .src_sg      = 0x7ffffff8,
> +    .dest        = 0x7ffffff8,
> +    .len         = 0x0fffffff,
>  };
>
>  static const struct masks ast2500_masks = {
> -    .src  = 0x3fffffff,
> -    .dest = 0x3ffffff8,
> -    .len  = 0x0fffffff,
> +    .src_direct  = 0x3fffffff,
> +    .src_sg      = 0x0,         /* SG mode not supported */

There's no need to add it in this case.

> +    .dest        = 0x3ffffff8,
> +    .len         = 0x0fffffff,
>  };
>
>  static const struct masks ast2400_masks = {
> -    .src  = 0x0fffffff,
> -    .dest = 0x0ffffff8,
> -    .len  = 0x0fffffff,
> +    .src_direct  = 0x0fffffff,
> +    .src_sg      = 0x0,         /* SG mode not supported */
> +    .dest        = 0x0ffffff8,
> +    .len         = 0x0fffffff,
>  };
>
>  static void test_addresses(const char *machine, const uint32_t base,
> @@ -208,7 +336,8 @@ static void test_addresses(const char *machine, const uint32_t base,
>
>      /* Check that the address masking is correct */
>      qtest_writel(s, base + HACE_HASH_SRC, 0xffffffff);
> -    g_assert_cmphex(qtest_readl(s, base + HACE_HASH_SRC), ==, expected->src);
> +    g_assert_cmphex(qtest_readl(s, base + HACE_HASH_SRC), ==,
> +                    expected->src_direct);
>
>      qtest_writel(s, base + HACE_HASH_DIGEST, 0xffffffff);
>      g_assert_cmphex(qtest_readl(s, base + HACE_HASH_DIGEST), ==, expected->dest);
> @@ -238,11 +367,21 @@ static void test_sha256_ast2600(void)
>      test_sha256("-machine ast2600-evb", 0x1e6d0000, 0x80000000);
>  }
>
> +static void test_sha256_sg_ast2600(void)
> +{
> +    test_sha256_sg("-machine ast2600-evb", 0x1e6d0000, 0x80000000);
> +}
> +
>  static void test_sha512_ast2600(void)
>  {
>      test_sha512("-machine ast2600-evb", 0x1e6d0000, 0x80000000);
>  }
>
> +static void test_sha512_sg_ast2600(void)
> +{
> +    test_sha512_sg("-machine ast2600-evb", 0x1e6d0000, 0x80000000);
> +}
> +
>  static void test_addresses_ast2600(void)
>  {
>      test_addresses("-machine ast2600-evb", 0x1e6d0000, &ast2600_masks);
> @@ -299,6 +438,9 @@ int main(int argc, char **argv)
>      qtest_add_func("ast2600/hace/sha256", test_sha256_ast2600);
>      qtest_add_func("ast2600/hace/md5", test_md5_ast2600);
>
> +    qtest_add_func("ast2600/hace/sha512_sg", test_sha512_sg_ast2600);
> +    qtest_add_func("ast2600/hace/sha256_sg", test_sha256_sg_ast2600);
> +
>      qtest_add_func("ast2500/hace/addresses", test_addresses_ast2500);
>      qtest_add_func("ast2500/hace/sha512", test_sha512_ast2500);
>      qtest_add_func("ast2500/hace/sha256", test_sha256_ast2500);
> --
> 2.25.1
>

