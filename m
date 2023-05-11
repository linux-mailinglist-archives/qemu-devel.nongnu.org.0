Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4D66FEC36
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 09:03:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px0Ji-0000gp-Ox; Thu, 11 May 2023 03:02:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1px0Jf-0000gR-F5
 for qemu-devel@nongnu.org; Thu, 11 May 2023 03:02:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1px0Jd-0007Av-Vc
 for qemu-devel@nongnu.org; Thu, 11 May 2023 03:02:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683788536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E32chyKU6QU+LIH2F12Vhtwa0+KxOD5BctbGlYQZgYg=;
 b=IvlRgPF6pLPfGA1Q2hh6jAv3eSLgjlvKyJQ9CEFNihRU4X2EhP4SwHuLL9mCouVoBM5i8C
 5v8FoxnRbjcDgcN5FU4cjItekq+wLCs6z0MmNGCmLUdx6t9rj8uHoD4urM4I2X6FKN2B1y
 UY1uTY3WrVsD2FOeD5pwgN2V5xqnXBM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-502-Vd_nq8LtNL2IzHQtu3ha9Q-1; Thu, 11 May 2023 03:02:15 -0400
X-MC-Unique: Vd_nq8LtNL2IzHQtu3ha9Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f42bcef2acso11893905e9.2
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 00:02:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683788534; x=1686380534;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E32chyKU6QU+LIH2F12Vhtwa0+KxOD5BctbGlYQZgYg=;
 b=C8Bw6BZBhhQgv9lL/if2PpfO7hIX1EYf5zMpyhV5oZy+ppRfQyg8VeT2THzBU+Pm81
 hZInvtVcvy4C9TFReI0Ak2ipn1SYOHahNA93m9TjNqimo4McVk5P0zXVA1sdDAjxKp3j
 BRxszEh0cN8oOyWTupSq8qq89+Jy81ccHWaCRGVuIZK2CoqV1PkRopPQBUIDap3ReS+E
 xNvQeeHvNOED0VQHvOGaDDAtw/c8HzDjJjhGo19stZLsZaxU/tU2Sr99pUJm/uVulEsl
 Cht13uB3atsUvGaXBj8xWqQkM8S7Ec5AHZDm84WNCt95zATKdPHTZULrpZb43fXEs8aO
 Vq+A==
X-Gm-Message-State: AC+VfDwjvsSjYDtxf0D19ImXtNFORbd1FLhAiXy/v3BEHbOujbOohrsK
 fjjkBkuUjQmpnWAbt8G/gHR/CZ9qrW2Ci3vyRZ67buyVKArWecqG+Pg6SOfav6OJyoWXKIu4VO/
 fZVYDdKozRvqepPA=
X-Received: by 2002:adf:cc90:0:b0:307:86fb:dada with SMTP id
 p16-20020adfcc90000000b0030786fbdadamr11514423wrj.36.1683788534032; 
 Thu, 11 May 2023 00:02:14 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5+Fgia8ZEQYsCXe3RytgJqFe3cPFJ8VKJqtpqJqOnVhMEKUbqWUOxp/eCyNtyDbqN1ZL6Y7A==
X-Received: by 2002:adf:cc90:0:b0:307:86fb:dada with SMTP id
 p16-20020adfcc90000000b0030786fbdadamr11514399wrj.36.1683788533660; 
 Thu, 11 May 2023 00:02:13 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.googlemail.com with ESMTPSA id
 d6-20020a056000114600b00306344eaebfsm19448692wrx.28.2023.05.11.00.02.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 May 2023 00:02:13 -0700 (PDT)
Message-ID: <ac20b31a-5018-186f-3d7c-ea9d7d0f11c4@redhat.com>
Date: Thu, 11 May 2023 09:02:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 27/27] mkvenv.py: experiment; use distlib to generate
 script entry points
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Ryo ONODERA <ryoon@netbsd.org>,
 Kyle Evans <kevans@freebsd.org>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Michael Roth <michael.roth@amd.com>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20230511035435.734312-1-jsnow@redhat.com>
 <20230511035435.734312-28-jsnow@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230511035435.734312-28-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.251, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/11/23 05:54, John Snow wrote:
> +    if checkpip():
> +        # We ran ensurepip. We need to re-run post_init...!
> +        args = [sys.executable, __file__, "post_init"]
> +        subprocess.run(args, check=True)
> +        return
> +
>       # Finally, generate a 'pip' script so the venv is usable in a normal
>       # way from the CLI. This only happens when we inherited pip from a
>       # parent/system-site and haven't run ensurepip in some way.

Can't this just be:

+    if not checkpip():
+        # Finally, generate a 'pip' script so the venv is usable in a normal
+        # way from the CLI. This only happens when we inherited pip from a
+        # parent/system-site and haven't run ensurepip in some way.
+        generate_console_scripts(["pip"])

even squashed in the original Debian 10 patch?

You don't need to generate the pip shims if ensurepip has been run.

Paolo


