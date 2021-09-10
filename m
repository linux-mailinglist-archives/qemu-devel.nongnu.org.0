Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6A0406E1A
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 17:21:38 +0200 (CEST)
Received: from localhost ([::1]:55594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOiLR-0007SP-P1
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 11:21:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mOiKE-0005wO-QQ
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 11:20:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mOiKB-0003no-2l
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 11:20:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631287215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zu2t76SAk4VynV7CNFW5CvFP980Bcx5So0YK2laZlVE=;
 b=hDNJNCPvmpumpAcL53XbCe8W4jIxtPlpTr1HSHVwDn90JdTLUYCNI8FVHGaz0lU7SlYYj5
 qopGWgNe7rQCxnV7kr5MqupFwCWlBvkFYavypLIeMH/RQ0It+APMrR1Hl/chYmJuItOgj/
 86/1EsLh1lPWYIorrTvz2TE5LQ8eVdo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-K4KQPHTrMOmVhO39U8ucHA-1; Fri, 10 Sep 2021 11:20:12 -0400
X-MC-Unique: K4KQPHTrMOmVhO39U8ucHA-1
Received: by mail-wm1-f71.google.com with SMTP id
 x10-20020a7bc76a000000b002f8cba3fd65so1079543wmk.2
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 08:20:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zu2t76SAk4VynV7CNFW5CvFP980Bcx5So0YK2laZlVE=;
 b=BHtv08j4TxoYPt8PnbA9ZM3RWG7aSB2ON0za9LJm8rfgLRvwfg61BNi5Ue5IlGQza/
 zmm2I0GpN9akFJdKHmclQLxTjQiHNWeXUc7QgbkRfV7NCUrjmhQOd6DXLR7L4PMbxF1s
 1TCBClivAupH8xq9msdtdlaj6815M0IH3IL+h3wzUdxf6oBle5xb1qk5kURMqAO69g8L
 baNblfQ2QOdVlB9g8oi4q+nhJbuP2bIveKoHpOiDwZyPvYaWfLJVU6uA6Pp6ndIXeF8y
 7V0PMgjJNPPxFeciRv85+HKDvV9YtJhbLu5v61ilGjA+pJACqC0caaQ9XO8zilJ5xl7U
 PykA==
X-Gm-Message-State: AOAM532VqtlMCiFlsxRi5vTsWNKR4xYAe9+lwsa8LilhJsi3P2TYnnS4
 vgIF5CQ0cxG2uSFeFZTfEMAfVsX0TpOF5jjS9DlpUQdpRo1Kx5NIPgOA9D1Uwr8JqWhp0k+eGr5
 6sa/ofFjFKR4F3Uc=
X-Received: by 2002:a1c:730a:: with SMTP id d10mr8991250wmb.59.1631287211391; 
 Fri, 10 Sep 2021 08:20:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZiLlrJn40xN1A13THVdgU+i0WaJmDTfaxH5izy/YLqKjmwDKnNrucDn366H1YumX6jKiw8A==
X-Received: by 2002:a1c:730a:: with SMTP id d10mr8991230wmb.59.1631287211186; 
 Fri, 10 Sep 2021 08:20:11 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id d9sm6144754wrb.36.2021.09.10.08.20.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Sep 2021 08:20:10 -0700 (PDT)
Subject: Re: [PATCH RFC server v2 01/11] vfio-user: build library
To: Jagannathan Raman <jag.raman@oracle.com>, qemu-devel@nongnu.org
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <cover.1630084211.git.jag.raman@oracle.com>
 <b556fb2bb8e364657a867dc5a83df937ffbf5880.1630084211.git.jag.raman@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <16c06c73-3b1b-1178-805d-3dceab4d41de@redhat.com>
Date: Fri, 10 Sep 2021 17:20:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <b556fb2bb8e364657a867dc5a83df937ffbf5880.1630084211.git.jag.raman@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.392, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.349,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 swapnil.ingle@nutanix.com, john.levon@nutanix.com, alex.williamson@redhat.com,
 marcandre.lureau@gmail.com, stefanha@redhat.com, thanos.makatos@nutanix.com,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/27/21 7:53 PM, Jagannathan Raman wrote:
> add the libvfio-user library as a submodule. build it as a cmake
> subproject.
> 
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  configure                | 11 +++++++++++
>  meson.build              | 28 ++++++++++++++++++++++++++++
>  .gitmodules              |  3 +++
>  MAINTAINERS              |  7 +++++++
>  hw/remote/meson.build    |  2 ++
>  subprojects/libvfio-user |  1 +
>  6 files changed, 52 insertions(+)
>  create mode 160000 subprojects/libvfio-user

> diff --git a/subprojects/libvfio-user b/subprojects/libvfio-user
> new file mode 160000
> index 0000000..647c934
> --- /dev/null
> +++ b/subprojects/libvfio-user
> @@ -0,0 +1 @@
> +Subproject commit 647c9341d2e06266a710ddd075f69c95dd3b8446
> 

Could we point to a sha1 of a released tag instead?


