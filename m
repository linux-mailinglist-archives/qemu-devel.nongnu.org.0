Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B8441812E
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 13:08:06 +0200 (CEST)
Received: from localhost ([::1]:43730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU5XJ-0001G7-KK
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 07:08:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mU5U1-0007KU-Tm
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 07:04:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mU5Tx-0002kW-Gx
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 07:04:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632567875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=arv4gUUn5ELS4TxcXrUj8aHoGLXT3iO+HxO7Xn0iyrI=;
 b=SZrXVE3/XevWRYC7UGsJVTqozkyedQZ2QPVpVTp1rroOQLLeb3e1U++7kdza7ezVNaSXUL
 B0CZnM0Gx+xfDWFqliXhld6jkoRG3O5VFbPyoiqQw8sww8v7+vYmHb7Dn1wlnN8u8evnbL
 eAk1g2sgboAlBne/6jtz6XlSAWfXirs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-fqluMQXCN2yYsfYQQtKCBA-1; Sat, 25 Sep 2021 07:04:34 -0400
X-MC-Unique: fqluMQXCN2yYsfYQQtKCBA-1
Received: by mail-wr1-f71.google.com with SMTP id
 z2-20020a5d4c82000000b0015b140e0562so10372643wrs.7
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 04:04:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=arv4gUUn5ELS4TxcXrUj8aHoGLXT3iO+HxO7Xn0iyrI=;
 b=FcOw6Qx9PvvjAqxLwYwdpWu9/EQTJ4d+zNRb8ZIpuvZ/UHw3TRf6X+L4ioSXcaHoMu
 Gvksbt+09tqzhuu/Zb4mTPmNrPD19D0xkcfXf5sgHNkhqP87xJelsGAZV0vWHSFTY4B/
 UGT6zH9ze38BVOgxuPQoryxwQuYYJswrh5iX5DBwWWaGtHFx8zo1pgpQJtsvuh1ZTM5h
 vOHvlTS0sC0YJchgDYFT3Jw4Q2zIZgwkCBuKE3/d8uFnGYqJboX6egmy3bNngtV/wRT1
 w4XXYt0HPU6g66x0maVdOyx2VbXmZ1IwgLIgrXUyEcLSXN2bZ17BiwAB+QQpmKrpUXnQ
 gATQ==
X-Gm-Message-State: AOAM533oBxSI3V+6F7MsAnOgpESwkbszlu5YD7OlzyCs4IXbH5zoZrar
 H1v7UAY4GVkh+kAskEkiOVRM8D5HYu3KxpmWe40xfQqfn1B3a5vil+JhL9vgnnElG1lxcf/+rM7
 +KoWNwQI54dD/09Q=
X-Received: by 2002:adf:f844:: with SMTP id d4mr16719555wrq.370.1632567872958; 
 Sat, 25 Sep 2021 04:04:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvklWy/TBeT5J3uQBLAs1dRKY0JV5WkyhC59qwwp46106SA3HnhFf73M+E9utHpNcbqeMziw==
X-Received: by 2002:adf:f844:: with SMTP id d4mr16719528wrq.370.1632567872698; 
 Sat, 25 Sep 2021 04:04:32 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id j4sm11152790wrt.67.2021.09.25.04.04.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Sep 2021 04:04:32 -0700 (PDT)
Message-ID: <7bb7e16e-35bf-c936-2406-bf44271c20d0@redhat.com>
Date: Sat, 25 Sep 2021 13:04:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 2/3] docs/devel/testing: add instruction to run a
 single acceptance test
To: Willian Rampazzo <willianr@redhat.com>, qemu-devel@nongnu.org
References: <20210923161141.232208-1-willianr@redhat.com>
 <20210923161141.232208-3-willianr@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210923161141.232208-3-willianr@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/23/21 18:11, Willian Rampazzo wrote:
> Add instructions to the Acceptance tests section about running a
> single test file or a test within the test file.
> 
> Signed-off-by: Willian Rampazzo <willianr@redhat.com>
> ---
>   docs/devel/testing.rst | 28 ++++++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


