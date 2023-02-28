Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0096A5888
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 12:47:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWyRp-0001yE-LD; Tue, 28 Feb 2023 06:47:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pWyRj-0001tf-Jh
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 06:47:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pWyRh-0007Xz-O6
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 06:47:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677584821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0nS0+RyN/H1npg0C1JIbWHZZ4SfeTHMMRyD4io5maU0=;
 b=bkQOTDbVvT59u8OUyKoZHI0fKCHpSdZlLa8iZd6dMoauHfRkGPE7SXPkRxjSMA6SZdZcJj
 Q4nVxOJATEiI3eENvVVXiEs2VnxFBCquz+LQLfVpl+TbF9JzWJ1LwBWgjMdZaGfvW2naCa
 L6jWj2y7CGIi+3yisrBlNOXMRLmtdlk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-176-63IPZbf0MbONIekvmBhSvQ-1; Tue, 28 Feb 2023 06:47:00 -0500
X-MC-Unique: 63IPZbf0MbONIekvmBhSvQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 l14-20020a5d526e000000b002cd851d79b2so332159wrc.5
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 03:46:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677584818;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0nS0+RyN/H1npg0C1JIbWHZZ4SfeTHMMRyD4io5maU0=;
 b=C7dLRQYYF8u525woA898qwiGr70c1I2gRHCNtpl+Ui6ifO3Whs0QOiHFti8iK5R+Yw
 vpxM282OFO/Va0b3WQIFkuEIRD4zooHERTFRktQnbprchKPVrm3it2dMy0Leh0cYXOY1
 mw45S3WiMEBvmhwqnOEgqnc9usgPQWWs6OgVR4inKs9BldLcqMLoSeI8YEDwiwptlUhM
 VKTsvpnh2FLA5I7onwMBoNOyPnDJ6oxDIGdP/pTtjGt1V3dyIdtOqBYW6Xvidk7d4LV6
 7eo70iQClUKyUV+izVpS1u6kjYQT24XKp3uiOwhJiljk01/3bPyDrvtHt2dM7nlp7+QR
 PtMA==
X-Gm-Message-State: AO0yUKWTsGCln8m4t3ZT3xI7j79mH7PRCPksAcIxWVV1jzFoQvs9hbSF
 Fx7QR/v5gD3Cfa4X5+qCIlGuuLKaZLrF+V4WQ3ro8Rjtp0SECizgg4Cir4lG/qspq2m1FMKNEEa
 7D7NUs7KefkcBLyTMkI2N
X-Received: by 2002:a05:600c:3d8f:b0:3e2:d3:b2b6 with SMTP id
 bi15-20020a05600c3d8f00b003e200d3b2b6mr2040458wmb.14.1677584818556; 
 Tue, 28 Feb 2023 03:46:58 -0800 (PST)
X-Google-Smtp-Source: AK7set9ukiJbDLLjbemAixbK8z9WCSaGKL85GygHLoDtlbZPMi8Ymp2kS5Em1Gh+o1UHoeYLychN2Q==
X-Received: by 2002:a05:600c:3d8f:b0:3e2:d3:b2b6 with SMTP id
 bi15-20020a05600c3d8f00b003e200d3b2b6mr2040437wmb.14.1677584818147; 
 Tue, 28 Feb 2023 03:46:58 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 z22-20020a1c4c16000000b003e206cc7237sm15096859wmf.24.2023.02.28.03.46.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 03:46:57 -0800 (PST)
Date: Tue, 28 Feb 2023 06:46:54 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
 libvir-list@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH 0/2] Deprecate support for 32-bit x86 and arm hosts
Message-ID: <20230228064623-mutt-send-email-mst@kernel.org>
References: <20230227111050.54083-1-thuth@redhat.com>
 <Y/z4rwv09Ckhbtfp@redhat.com>
 <001bedba-b12f-4dd8-0866-7ccb9ce877d0@redhat.com>
 <Y/3C+jC3Lk5MJxfu@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y/3C+jC3Lk5MJxfu@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, Feb 28, 2023 at 09:01:46AM +0000, Daniel P. Berrangé wrote:
> If we're merely wanting to drop CI support, we can do that any time and
> deprecation is not required/expected.  We should only be using deprecation
> where we're explicitly intending that the code will cease to work.

Good point, IMO.

-- 
MST


