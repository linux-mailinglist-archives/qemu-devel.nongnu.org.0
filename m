Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 041056FC66F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 14:33:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwMVB-0004LM-Ny; Tue, 09 May 2023 08:31:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pwMUv-0004IE-7J
 for qemu-devel@nongnu.org; Tue, 09 May 2023 08:31:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pwMUs-0003wi-6R
 for qemu-devel@nongnu.org; Tue, 09 May 2023 08:31:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683635473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U9rTGmLR74FHUvEx6JFvgXk3ZeuWigk518EqWgQXhco=;
 b=Y+XZxzv8gw7Slg+PqsDlFXYt/ISXx2zxTdsiHNOkGSPZQonfceHd4UOE10h6uTWT6gey/x
 5vBSB8QOpAXmZlwA1M2SEiTPjoapo/QObF0rTw0OenX5chalIhYtEZF9g9xHJqvGETltWL
 TxuRaMicvdnvoDYVNtsEpi0xkppK3B0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-CaliVV8fOVe63L001Ot-DA-1; Tue, 09 May 2023 08:31:11 -0400
X-MC-Unique: CaliVV8fOVe63L001Ot-DA-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-9662fbb79b3so313979666b.0
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 05:31:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683635470; x=1686227470;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=U9rTGmLR74FHUvEx6JFvgXk3ZeuWigk518EqWgQXhco=;
 b=TjZ1GBasz2zb5gClHnfofN8+S3YipDOScaXd0OVOS7IOerfm5hDT6EfYrJE83AzRJu
 TlOyuGXyNkopcxlVgE01NvsuvZ1r44CzCLTMA7MgklB3X4l0vH+QxQgpyciuUVopaY3Y
 v0ljBxWxv97eBhT6e6gmvcQPi49ickTDEFWa7TM0nwl+CscQD6bZeWz2UYuhtBdDrKIB
 9lee6lqJ/dQylvfq9tx24/VjNwySRzyb6KC2OUbcqR9WC6U2Z1oR42+xvu1pt5FYD/lA
 UJUckBr0XcnSwLTVWv9RQlD+rqHMAMnZ11rHsCx7k98LbbRzzL5aEX3LUbXz1kxDdiwK
 fJJA==
X-Gm-Message-State: AC+VfDyxyuKmSlUqdyWwcGdnM4g+UGPBYKMI5mW1/Py5CjurbZT4X0kw
 RUd7zHgQ3KloIH1DYBm89Kyh/tlzzY1/Q8Ys4/jN8KcnNIier2Wu94uDn8qeqxJpdwf1BrXG4qy
 9nkoCafbc7xojpaq+5MMGvxI=
X-Received: by 2002:a17:907:9810:b0:969:f677:11b4 with SMTP id
 ji16-20020a170907981000b00969f67711b4mr1722654ejc.37.1683635470382; 
 Tue, 09 May 2023 05:31:10 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7imW6H4f+RvhUOW5NQ7UUvY7CpstOrxlpxN2zAwPBXHPGAj8cekfac69jwTMMVQkZD3InkNg==
X-Received: by 2002:a17:907:9810:b0:969:f677:11b4 with SMTP id
 ji16-20020a170907981000b00969f67711b4mr1722639ejc.37.1683635470097; 
 Tue, 09 May 2023 05:31:10 -0700 (PDT)
Received: from ?IPV6:2003:cf:d738:7fbf:bf54:7947:8c4:60ed?
 (p200300cfd7387fbfbf54794708c460ed.dip0.t-ipconnect.de.
 [2003:cf:d738:7fbf:bf54:7947:8c4:60ed])
 by smtp.gmail.com with ESMTPSA id
 ml18-20020a170906cc1200b0094f124a37c4sm1299910ejb.18.2023.05.09.05.31.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 May 2023 05:31:09 -0700 (PDT)
Message-ID: <a9216c0d-86df-410d-d32e-6d6fd65acc30@redhat.com>
Date: Tue, 9 May 2023 14:31:08 +0200
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

I wonder: The plan is to have "1.5e+1k" be parsed as "1.5e" + endptr == 
"+1k"; but "0x1p1" is not parsed at all (could be "0x1" + "p1"). Is that 
fully intentional?

(Similarly, "1.1.k" is also not parsed at all, but the problem there is 
not just two decimal points, but also that "1.1" would be an invalid 
size in itself, so it really shouldn’t be parsed at all.)

I don’t think it matters to users, really, but I still wonder.

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

This is “correct” (i.e. it’s the value we’ll get right now, which is the 
wrong one), but gcc complains that the array index is out of bounds 
(well...), which breaks the build.

Hanna

> +
> +    res = 0xbaadf00d;
> +    err = qemu_strtosz(str, NULL, &res);
> +    g_assert_cmpint(err, ==, -EINVAL);
> +    g_assert_cmphex(res, ==, 0xbaadf00d);
>   }


