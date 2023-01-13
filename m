Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 953966690EA
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 09:30:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGFR4-0002Uu-Kw; Fri, 13 Jan 2023 03:29:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pGFR2-0002Tx-2e
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 03:29:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pGFQz-0001gi-Ir
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 03:29:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673598548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AtYF55lI7ABSr3HOXxn349J+rDNEp7cVLLDCD2wJ5JA=;
 b=MzWg750W3LQ6vrYBqGizTaWKxVIsXVJNCuu7sYTxhtO4k+3A12a6BJT6Lcyu1RCpKKVxZx
 qvYc1CLTqKP6pAnWKoenlMBg4fLm+i5zm50it9kWb2Qp9ob05fA4sdNwesS0bWspn0B7Lg
 zOqB+z+hi3EuU9CiQnfhW17mfRU33Jw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-508-oKP1Od8NPdyT3SRq49Bnfw-1; Fri, 13 Jan 2023 03:29:07 -0500
X-MC-Unique: oKP1Od8NPdyT3SRq49Bnfw-1
Received: by mail-ed1-f71.google.com with SMTP id
 y21-20020a056402359500b0048123f0f8deso14196741edc.23
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 00:29:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AtYF55lI7ABSr3HOXxn349J+rDNEp7cVLLDCD2wJ5JA=;
 b=4cxVXhJu9RbMnAjb1oEvVanCiodsO9EWbI6Ys3NvjcUH/z2Bc7CqPHZOoXzNZaai9p
 bZiw0wjzfYWRHMIyTU5yV01td05pod4GBu4XRfAdBfIRcCW88L8f5fg52p/pn+P9G2Ql
 s35fnUZWFEVJ648RKqaOf9cjz98L0K8VkzsgivAObx62cJ/Wujmu7vRaOMEaMx67ayZZ
 uanjLTkriuxrjCcwc8R2ECh8zZSIehp/zxaXyGZPY2qq6vXs25sKvkkvIZ+c4si7JUrV
 /aearfyyA/IGwXeI2/bJiaumac1+JiZO8mKT/CVtIab6DhqNE8hIKIRKF0fUFlA0yju5
 17SQ==
X-Gm-Message-State: AFqh2kpZZQXxFQw5vZAAQejawvdLXKXboA/LjR9WPIIQHtXbZg/UH0Bc
 TwjbWlI8yJ2wh0q9zypmYluggxaeSKPLk6sHLmDjuth1h/ErpbVSRuwh9sR2Cway9aObvMOZdgt
 6RyHgCEy8ImV/OAk=
X-Received: by 2002:a17:907:d387:b0:7c1:6fd3:1ef3 with SMTP id
 vh7-20020a170907d38700b007c16fd31ef3mr69929532ejc.33.1673598546258; 
 Fri, 13 Jan 2023 00:29:06 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuE6YbR9RyesogCmyJxo7an1LFRf7zxionYXVfNUDaJbM8QZglKyaOkjYIPWYsz1WyxLlx3Dw==
X-Received: by 2002:a17:907:d387:b0:7c1:6fd3:1ef3 with SMTP id
 vh7-20020a170907d38700b007c16fd31ef3mr69929518ejc.33.1673598545992; 
 Fri, 13 Jan 2023 00:29:05 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.googlemail.com with ESMTPSA id
 kv24-20020a17090778d800b0078d9cd0d2d6sm8332621ejc.11.2023.01.13.00.29.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 00:29:05 -0800 (PST)
Message-ID: <2953a506-23cc-abe7-7774-077ebdc6c341@redhat.com>
Date: Fri, 13 Jan 2023 09:29:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 07/26] configure: replace Perl usage with sed
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Beraldo Leal <bleal@redhat.com>,
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ed Maste <emaste@freebsd.org>,
 Yanan Wang <wangyanan55@huawei.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 John G Johnson <john.g.johnson@oracle.com>
References: <20230110173922.265055-1-alex.bennee@linaro.org>
 <20230110173922.265055-8-alex.bennee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230110173922.265055-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 1/10/23 18:39, Alex Bennée wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Let's try to reduce our Perl usage during config/build-time.
> 
> Note: this patch might be dropped if "configure: remove
> backwards-compatibility code" is merged earlier.

It can be dropped now.

Paolo

> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Tested-by: Thomas Huth <thuth@redhat.com>
> Message-Id: <20230110132700.833690-4-marcandre.lureau@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   configure | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/configure b/configure
> index 2281892657..9a944698b4 100755
> --- a/configure
> +++ b/configure
> @@ -2571,11 +2571,9 @@ else
>     if test -f meson-private/cmd_line.txt; then
>       # Adjust old command line options whose type was changed
>       # Avoids having to use "setup --wipe" when Meson is upgraded
> -    perl -i -ne '
> -      s/^gettext = true$/gettext = auto/;
> -      s/^gettext = false$/gettext = disabled/;
> -      /^b_staticpic/ && next;
> -      print;' meson-private/cmd_line.txt
> +    sed -i.bak -e 's/^gettext = true$/gettext = auto/g' \
> +      -e 's/^gettext = false$/gettext = disabled/g' \
> +      -e '/^b_staticpic/d' meson-private/cmd_line.txt
>     fi
>   fi
>   


