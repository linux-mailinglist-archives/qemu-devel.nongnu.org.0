Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0983F9A52
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 15:36:08 +0200 (CEST)
Received: from localhost ([::1]:55690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJc1V-0006DJ-P5
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 09:35:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJbyx-0002so-B4
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 09:33:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJbyv-0005RM-Rn
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 09:33:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630071197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yQIyusZ8ffllkE8PB2IO3mlNOMO6D4Peaywaf7ndtKg=;
 b=Ia4K1QnYg3iVvb8CJuz49fxsim3PheEWtnf4fwb4bMiZ3jLnvdEgLsFYW/1VhA3D5ui6Zi
 4rI0byy1D0VDxO/4CgwBkdiEhiByNDZgZZw/CvCvSoNy+pBkJ7OD6onndynahObIatB52o
 3hTcwgtU8jZsNqSy3NMDUMdB8IB/Sjg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-t4Tf5M_-NPmEM08kqZjK1A-1; Fri, 27 Aug 2021 09:33:15 -0400
X-MC-Unique: t4Tf5M_-NPmEM08kqZjK1A-1
Received: by mail-wm1-f72.google.com with SMTP id
 j135-20020a1c238d000000b002e87aa95b5aso5084102wmj.4
 for <qemu-devel@nongnu.org>; Fri, 27 Aug 2021 06:33:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yQIyusZ8ffllkE8PB2IO3mlNOMO6D4Peaywaf7ndtKg=;
 b=VCTyRu+LMMQPNPkIRd451asXpERzBW5QzdFOWjQHB45R4JoZO+JBDcKpOcH5OuFj+5
 rQxkiuKFSSLT8O5QosJ+F3ZCfRK5iEV4KrlQuQjuS54uix756lXfDp9eQJ5D/24tlj88
 Y6l7yL6R1NFMpH49R5myRw2vI2KgSF2Ig2e1q8EaSp7Ap982TjBfI6CBelcYgSJ4OF4k
 boGmHuR8Z02QBI0nCr09Cy11t2wW1BSIPxr81iDkF5dCf14BRmX4nLl3T5pcObDMZBNK
 Z88sJAaNFLUDAB68oPhStFRlLV9W5pFTpxrPkT7myH9ZHT9seaDMyeTwos4qMUFBzb3x
 S59A==
X-Gm-Message-State: AOAM532GsCbgZQ4vBAFMk3oYmJqCvlRmVgwyuucIF2PhZzPtYQ8oA5d9
 rQtWPHb0tBzCyMqQ/5UpB9ZxHMGPnEcckFtjI8YaPEglShX9+cEy4CJ+GF5khU7+fZDiBoA28UF
 5CgsCzRV7eOlGmHQ=
X-Received: by 2002:a5d:4f8d:: with SMTP id d13mr10292854wru.315.1630071194609; 
 Fri, 27 Aug 2021 06:33:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHK3CJ+n33JFFSeVcqaqvCRJw4DteJLLBlsBImmcr0Uv/v96hG+g5g+IWBj7B7MRDLDICpwA==
X-Received: by 2002:a5d:4f8d:: with SMTP id d13mr10292823wru.315.1630071194412; 
 Fri, 27 Aug 2021 06:33:14 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id 19sm11354685wmo.39.2021.08.27.06.33.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Aug 2021 06:33:14 -0700 (PDT)
Subject: Re: [PATCH v3 09/18] ui/vdagent: disconnect handlers and reset state
 on finalize
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20210805135715.857938-1-marcandre.lureau@redhat.com>
 <20210805135715.857938-10-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <912d7df6-dd3a-d4be-57bb-184fd142af93@redhat.com>
Date: Fri, 27 Aug 2021 15:33:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210805135715.857938-10-marcandre.lureau@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.437, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/5/21 3:57 PM, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Avoid handlers being called with dangling pointers when the object is
> freed.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  ui/vdagent.c | 25 +++++++++++++++----------
>  1 file changed, 15 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


