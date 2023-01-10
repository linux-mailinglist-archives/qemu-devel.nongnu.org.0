Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3409E663C17
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 10:01:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pF9hN-0001LT-Ok; Tue, 10 Jan 2023 03:09:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pF9hG-0001Ha-Sg
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 03:09:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pF9hE-0000b9-35
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 03:09:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673338163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eg6pIzfk5vKkPSb+kJL6n/HwR+JmS1XbU1ZjUEnXDUI=;
 b=DXtwumK10/qK7ea1ioZi0D+M9MRrwUmE7VXRFqxdWvyw02TFJl/3rUdfgcKACumtnuprJb
 eXDITUNdihf1/TTavoY2lSF/59pKcgoKBNF/zNVv24o29Ix9XyzukcIstJ4nHiBwnwwLcW
 taEREBzgfqP/dRxw/cH2AbZJJd1LTjY=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-414-La_Sr_svPBSJedh-B0NkAA-1; Tue, 10 Jan 2023 03:09:22 -0500
X-MC-Unique: La_Sr_svPBSJedh-B0NkAA-1
Received: by mail-qk1-f198.google.com with SMTP id
 m3-20020a05620a24c300b006fee2294e97so8276350qkn.11
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 00:09:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eg6pIzfk5vKkPSb+kJL6n/HwR+JmS1XbU1ZjUEnXDUI=;
 b=keJ2MKRoFvWkNKvFahl3LxXXR2EQxMzHYHnf0hrGlP1kYQF7pUwD42aOTZh/3vVwxw
 n8GpBFoWoKqyThTnl3U/4MHrJ9D/MLKW429GkHbMfJR2JN/ew+mdvV9pdK4F91OuIy3W
 Fu4+zXqCpIEswXC4BYbZmka1goZFsaXblaAn9OYRC82WoWx0pIdrhX7rNXvs2wvFrso/
 BLbZP0eDbrb9fpGZ5idonXVk51T31y+Eggsx83xl0H1RLqtZm2eIJDXFuN+VufmTx+Bs
 nUWsfYydHH+gPFoBTSg11vfC5+jxmAyUsoVmzF6O14TmVlzwhPQkQlWJP2YygOiiXJWm
 sD9A==
X-Gm-Message-State: AFqh2koCiWUn4w8lfPm7ZFjQTqCK+ywMFO23XFSKSN56wJtkFV94TG5V
 P9e5epOUPvJMqV/O3fY++/Sfver6sbsTz2JxtdJj0sakwpc4aF3q5QweSX35Yrft+kGDApI+rkj
 KYz19ULKXF68BQ4w=
X-Received: by 2002:ad4:52e5:0:b0:4c7:797e:7788 with SMTP id
 p5-20020ad452e5000000b004c7797e7788mr87174506qvu.20.1673338161759; 
 Tue, 10 Jan 2023 00:09:21 -0800 (PST)
X-Google-Smtp-Source: AMrXdXukRsZkXTZ2sz8ANcFzgYWnjSbTsdpCWJpl52Qiz/g9Y6fhOnLO+Y4Fmc9YAlA5IFzXrtEIKg==
X-Received: by 2002:ad4:52e5:0:b0:4c7:797e:7788 with SMTP id
 p5-20020ad452e5000000b004c7797e7788mr87174490qvu.20.1673338161547; 
 Tue, 10 Jan 2023 00:09:21 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-179-237.web.vodafone.de.
 [109.43.179.237]) by smtp.gmail.com with ESMTPSA id
 c5-20020a05620a268500b006e8f8ca8287sm1986160qkp.120.2023.01.10.00.09.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 00:09:21 -0800 (PST)
Message-ID: <f4b11be2-96ff-a488-0622-d52177bcd3d2@redhat.com>
Date: Tue, 10 Jan 2023 09:09:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 6/8] Update lcitool and fedora to 37
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Eric Farman <farman@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 pbonzini@redhat.com, Markus Armbruster <armbru@redhat.com>,
 qemu-s390x@nongnu.org, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Ed Maste <emaste@freebsd.org>, kraxel@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Michael Roth <michael.roth@amd.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>
References: <20230110080246.536056-1-marcandre.lureau@redhat.com>
 <20230110080246.536056-7-marcandre.lureau@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230110080246.536056-7-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

On 10/01/2023 09.02, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Fedora 35 is EOL, upstream lcitool replaced it with 37.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
...
> diff --git a/tests/lcitool/libvirt-ci b/tests/lcitool/libvirt-ci
> index e3eb28cf2e..319a534c22 160000
> --- a/tests/lcitool/libvirt-ci
> +++ b/tests/lcitool/libvirt-ci
> @@ -1 +1 @@
> -Subproject commit e3eb28cf2e17fbcf7fe7e19505ee432b8ec5bbb5
> +Subproject commit 319a534c220f53fc8670254cac25d6f662c82112

In case you respin this patch, please add a note to the commit description 
explaining why you update the submodule here (I assume it's necessary to 
pull in some changes for F37 support?).

Apart from that:
Reviewed-by: Thomas Huth <thuth@redhat.com>


