Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D25A260FCC2
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 18:15:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo5U2-0002pZ-KK; Thu, 27 Oct 2022 12:11:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oo5Tt-0001w7-3N
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 12:11:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oo5Tr-0005OE-LJ
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 12:11:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666887102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BX1gi+Nf37EaZfQeL22TQHTZ5k62jwipJW7/Kh9uwNI=;
 b=eDsHTsVaAXipDfiJvSV+Ls2F9Nx4t8T53LgKm52KsdRddqPZvF9aYdh6CRAmcAF/MKfka3
 NIFC/zwB0dim4S1ZyqIoTKQ2oHUGJZx+UyMzVxj9YpSzTvN/ZPamJOpyVt4Z2oj7WMjPQw
 mq+/j/mYYEBFvlNl7M0NWUWjHp+P+hs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-586-t2mX04MlO5-FeF01-tnCIA-1; Thu, 27 Oct 2022 12:11:40 -0400
X-MC-Unique: t2mX04MlO5-FeF01-tnCIA-1
Received: by mail-wm1-f70.google.com with SMTP id
 r18-20020a05600c35d200b003cb2ba79692so906058wmq.5
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 09:11:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BX1gi+Nf37EaZfQeL22TQHTZ5k62jwipJW7/Kh9uwNI=;
 b=VKrfBsWN4lkdalujcqEUz6MJE5umSAmW4gmW2cPNFidjz+XdmFFzqwOAM4bHLrUP96
 To9iNQ7+68Cw2WzCZKLD1QGcYnuY1dvBMzNEt2zXXqbW1+a3ayvQzj0kTomctSnBL1h/
 FqMABf8kRdWnsZMD9ylg101KhPzcdu9zZezI86CsdGjHMI7cr9lXGs53D6DY3Evr4ZI+
 vq2gYwqJiTUGSGT/fm6fbnoXL7wD/etwQ64sXBU3FsUYeRDuxVkyfIyg8uX5MdJVlR2r
 hQyCVwcvtbck6SfshDdL8JMfd29+yPYTjf2PkoBYXHpkIobIHnDLks6qTZ+IcAOkM6L0
 QYug==
X-Gm-Message-State: ACrzQf15Sb8a3WgLEsOD2+pPUxOYofIKPJSkuygHWS7VDytiULiJdqR0
 wWdHz/m7syiefocgcED9Z1WRHXixQYLZF14ItSUCRcyWWX+8pT/7ecnJJlGRQ0bh/26u1hO5eJO
 cgEqEkq+Mi3Kl2RU=
X-Received: by 2002:a7b:c4cf:0:b0:3cf:497c:ae3a with SMTP id
 g15-20020a7bc4cf000000b003cf497cae3amr6419781wmk.177.1666887099350; 
 Thu, 27 Oct 2022 09:11:39 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5m75m0/cp6qzye4D6+HDDMsvmyc6J9hL7hMiqneyeULj4n82mAUtDL5HyRvGoLClMhZ428/w==
X-Received: by 2002:a7b:c4cf:0:b0:3cf:497c:ae3a with SMTP id
 g15-20020a7bc4cf000000b003cf497cae3amr6419762wmk.177.1666887099153; 
 Thu, 27 Oct 2022 09:11:39 -0700 (PDT)
Received: from [192.168.8.100] (tmo-066-116.customers.d1-online.com.
 [80.187.66.116]) by smtp.gmail.com with ESMTPSA id
 a12-20020a5d4d4c000000b0022e55f40bc7sm1444134wru.82.2022.10.27.09.11.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 09:11:38 -0700 (PDT)
Message-ID: <fe0b446d-19f8-13d3-5513-5b651bbe847e@redhat.com>
Date: Thu, 27 Oct 2022 18:11:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 26/26] tests/tcg: include CONFIG_PLUGIN in
 config-host.mak
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
 <20221020115209.1761864-27-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221020115209.1761864-27-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 20/10/2022 13.52, Alex Bennée wrote:
> From: Paolo Bonzini <pbonzini@redhat.com>
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20221013131304.623740-1-pbonzini@redhat.com>
> ---
>   configure | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/configure b/configure
> index 8c2c4c1a04..4275f5419f 100755
> --- a/configure
> +++ b/configure
> @@ -2486,6 +2486,9 @@ echo "HOST_CC=$host_cc" >> $config_host_mak
>   if test -n "$gdb_bin"; then
>       echo "HAVE_GDB_BIN=$gdb_bin" >> $config_host_mak
>   fi
> +if test "$plugins" = "yes" ; then
> +    echo "CONFIG_PLUGIN=y" >> $config_host_mak
> +fi

Ugh, this is super-confusing that the configuration for 
tests/tcg/config-host.mak uses the same variable as the configuration for 
the top level config-host.mak ... not the fault of this patch, but we should 
maybe disentangle this in the future and rename the variable to 
tcg_config_host_mak or something like that.

Anyway, for this patch:

Reviewed-by: Thomas Huth <thuth@redhat.com>


