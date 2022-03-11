Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7218E4D64A7
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 16:31:30 +0100 (CET)
Received: from localhost ([::1]:39042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nShEm-0000JS-5W
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 10:31:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nShCZ-00081z-9I
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 10:29:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nShCW-0005lB-FV
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 10:29:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647012546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R95Gk4QKvM4tGF8IeFavYUV9TYFG7JhpdfeJBGTOoPo=;
 b=BF+qENcPLcSfAuLOKEZE2yoOvLNk6XiA8c1MG+9AUITKSGADRCU2yUYngkRXrb7dTiNLvK
 2ZQcgAxuz0rTOeEDcfsIehayrr/vZl6cIxyKZThyHqQYjzH64AUJ4eUFUnauvugDL5T/MY
 rjDJEZWuF6Ak2K3dn242f2MZn/BxZY8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-326-YItwn7d9ObuRJQ4pOho_Kg-1; Fri, 11 Mar 2022 10:29:05 -0500
X-MC-Unique: YItwn7d9ObuRJQ4pOho_Kg-1
Received: by mail-wm1-f69.google.com with SMTP id
 v125-20020a1cac83000000b0037e3d70e7e1so5650316wme.1
 for <qemu-devel@nongnu.org>; Fri, 11 Mar 2022 07:29:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=R95Gk4QKvM4tGF8IeFavYUV9TYFG7JhpdfeJBGTOoPo=;
 b=qqDgjRG5oEUs6Uis61RNL1sUN/2tvKjWxEl84NHqATVT6q/8gNGni2BrMEhW2YXfJH
 o1eXcxa1cvbQj+TIgLdOnCqDEN3ltcsBl+stLVSJXFWi+FlhTUCWOOI7NsREJtFvoria
 JpMXyARu/hBMii5jn27/2CdXq0+vTDq/mPeje/izhwGZw74NyHobpiQfS0XZwjvn1uzf
 7F10JeOAMD0DQt1NPHH/MXS1CstCMQcixrrfgetSQMmxRSLDQn8ZKV2qOpQWd9ZOV52z
 Oa2kpWxHITbv/2xA/Ckjo8LB6z3g4pNBUAsewRKor4656Gh5YCBgiJOYUbOFdVEqTLwY
 8gug==
X-Gm-Message-State: AOAM5303kyX5IZLHBeby3KhAiMd8unGPyaNkamNnBh+CkbnSeVE/hxXR
 WioQ/9n/o9AfdnAWakvFi1Od+LUsNtphJbwrsiiPrX2znbX5yQf1wOMjM7Nx9GQ5W/rk3sLwyUa
 T6TpAASgisBcZn+g=
X-Received: by 2002:a5d:4d04:0:b0:203:8af7:874d with SMTP id
 z4-20020a5d4d04000000b002038af7874dmr6065532wrt.488.1647012543935; 
 Fri, 11 Mar 2022 07:29:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzut7ZIZbxQcwuOfWYKEKtRJxmda42DPnk7UYf2BendDnJk6EzbLtbM1JrMTV1EYj/4NNjVvQ==
X-Received: by 2002:a5d:4d04:0:b0:203:8af7:874d with SMTP id
 z4-20020a5d4d04000000b002038af7874dmr6065521wrt.488.1647012543696; 
 Fri, 11 Mar 2022 07:29:03 -0800 (PST)
Received: from redhat.com ([2.53.27.107]) by smtp.gmail.com with ESMTPSA id
 c2-20020a056000184200b002037b40de23sm6535882wri.8.2022.03.11.07.29.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Mar 2022 07:29:03 -0800 (PST)
Date: Fri, 11 Mar 2022 10:28:59 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 01/11] tests/acpi: allow virt memory hotplug changes
Message-ID: <20220311102854-mutt-send-email-mst@kernel.org>
References: <20220311053759.875785-1-kraxel@redhat.com>
 <20220311053759.875785-2-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220311053759.875785-2-kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 11, 2022 at 06:37:49AM +0100, Gerd Hoffmann wrote:
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  tests/qtest/bios-tables-test-allowed-diff.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8bf4..e569098abddc 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,2 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/virt/SSDT.memhp",
> -- 
> 2.35.1


