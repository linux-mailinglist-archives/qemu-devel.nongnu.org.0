Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A716FCA03
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 17:15:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwP3Z-0004B3-Qx; Tue, 09 May 2023 11:15:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pwP3X-0004Al-OA
 for qemu-devel@nongnu.org; Tue, 09 May 2023 11:15:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pwP3W-0007CU-7S
 for qemu-devel@nongnu.org; Tue, 09 May 2023 11:15:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683645309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CZW8ifmRiEhiN0jwQsnCViXssnt4uSaR7Q3ztE4OPg0=;
 b=i7QHiolKxkNCEcJ8lJ5pt3+eseZOWq62Bk2fUMHdYjU5kqDXkTUMXR51DanLppjpotl4OY
 ImZ64zSIfW27ufwhhEGZOa6b4WhS8gRS8RZRpp4TB8joCQBAR1oNKKCcGyoH58JKUlEC2B
 T7k/fwDH0QQc5e9xI5vZcbUvVjs+RzE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675-exmmB3vVOpWtDDfuQz-GTg-1; Tue, 09 May 2023 11:15:07 -0400
X-MC-Unique: exmmB3vVOpWtDDfuQz-GTg-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-50bc6c6b9dbso7167910a12.0
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 08:15:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683645306; x=1686237306;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CZW8ifmRiEhiN0jwQsnCViXssnt4uSaR7Q3ztE4OPg0=;
 b=EGYLaqSmBSy+aIjnCWlUd9L6xfkyt2CKF+wcrmJMjUzlR4UNqRq+tAFkN40tHCQ5/p
 6bDsLgGPee8xdc5rZavK2XKsJ9nRxG2whynZ1LbaBgLaop74pVgEmvg8AQLeU1OQqrRF
 /cXusGQUpPdIfblKdzfknRkQ4msdUVFVARYZqi21iyNaEWYMVu6olqLCl7PDH7+kaWUN
 mG0YJLuUbQBL7oR2gnP1twPzxaneaIcMlwRJwgMVmJANt43i7DbGEa7k4YOsNxGDBWjG
 EmbbJh2Y8WCZfkcHasna1/+shvV0NdeRDmfVdSJTWwmsGEqbJpYdjjhMFmJKe4zWk1fH
 HvVQ==
X-Gm-Message-State: AC+VfDxDqjC+hZwaoJwempUgL7c0AocGN8M5HJ7Wbo1jDZ7zU2WDPnPB
 nGOh/0u9N2N5gaUJnThy0SKiSxcwrJCFaJ4HL9Rke+G9myb9I0xl9S/xVwjpexUcSysl19xE7UC
 MVT27Wd/ZFYse2ELFv2uX8Lg=
X-Received: by 2002:a17:907:3f9c:b0:966:1bf2:2af5 with SMTP id
 hr28-20020a1709073f9c00b009661bf22af5mr9712091ejc.22.1683645306402; 
 Tue, 09 May 2023 08:15:06 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6+rluiJJsyT4rpqTas7B4VpcQZTwvQtAaGElHljFVN1kwPHe3FVR4e4HA+0ENE2fdSPRrpAA==
X-Received: by 2002:a17:907:3f9c:b0:966:1bf2:2af5 with SMTP id
 hr28-20020a1709073f9c00b009661bf22af5mr9712059ejc.22.1683645306007; 
 Tue, 09 May 2023 08:15:06 -0700 (PDT)
Received: from ?IPV6:2003:cf:d706:2e02:6e14:9279:969b:d328?
 (p200300cfd7062e026e149279969bd328.dip0.t-ipconnect.de.
 [2003:cf:d706:2e02:6e14:9279:969b:d328])
 by smtp.gmail.com with ESMTPSA id
 de9-20020a1709069bc900b0094e6a9c1d24sm1472686ejc.12.2023.05.09.08.15.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 May 2023 08:15:05 -0700 (PDT)
Message-ID: <e2aca275-8a19-b0b7-8939-aefd29ce270b@redhat.com>
Date: Tue, 9 May 2023 17:15:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 06/11] test-cutils: Add more coverage to qemu_strtosz
Content-Language: en-US
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20230508200343.791450-1-eblake@redhat.com>
 <20230508200343.791450-7-eblake@redhat.com>
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <20230508200343.791450-7-eblake@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.421, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 08.05.23 22:03, Eric Blake wrote:
> Add some more strings that the user might send our way.  In
> particular, some of these additions include FIXME comments showing
> where our parser doesn't quite behave the way we want.
>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>   tests/unit/test-cutils.c | 226 +++++++++++++++++++++++++++++++++++++--
>   1 file changed, 215 insertions(+), 11 deletions(-)
>
> diff --git a/tests/unit/test-cutils.c b/tests/unit/test-cutils.c
> index afae2ee5331..9fa6fb042e8 100644
> --- a/tests/unit/test-cutils.c
> +++ b/tests/unit/test-cutils.c

[...]

> @@ -2875,6 +3056,20 @@ static void test_qemu_strtosz_trailing(void)
>       err = qemu_strtosz(str, NULL, &res);
>       g_assert_cmpint(err, ==, -EINVAL);
>       g_assert_cmphex(res, ==, 0xbaadf00d);
> +
> +    /* FIXME overflow in fraction is buggy */
> +    str = "1.5E999";
> +    endptr = NULL;
> +    res = 0xbaadf00d;
> +    err = qemu_strtosz(str, &endptr, &res);
> +    g_assert_cmpint(err, ==, 0);
> +    g_assert_cmpuint(res, ==, EiB /* FIXME EiB * 1.5 */);
> +    g_assert(endptr == str + 9 /* FIXME + 4 */);
> +
> +    res = 0xbaadf00d;
> +    err = qemu_strtosz(str, NULL, &res);
> +    g_assert_cmpint(err, ==, -EINVAL);
> +    g_assert_cmphex(res, ==, 0xbaadf00d);

Got it now!

Our problem is that `endptr` is beyond the end of the string, precisely 
as gcc complains.  The data there is undefined, and depending on the 
value in the g_assert_cmpuint() (which is converted to strings for the 
potential error message) it sometimes is "endptr == str + 9" (the one in 
the g_assert()) and sometimes isn’t.

If it is "endptr == str + 9", then the 'e' is taken as a suffix, which 
makes `res == EiB`, and `endptr == "ndptr == str + 9"`.

If it isn’t, well, it might be anything, so there often is no valid 
suffix, making `res == 1`.

So the solution is to set `str = "1.5E999\0\0"`, so we don’t get out of 
bounds and know exactly what will be parsed.  Then, at str[8] there is 
no valid suffix (it’s \0), so `res == 1` and `endptr == str + 8`.  This 
will then lead to the qemu_strtosz(str, NULL, &res) below succeed, 
because, well, it’s a valid number.  I suppose it failed on your end 
because the out-of-bounds `str[9]` value was not '\0'.

That was a fun debugging session.

Hanna


