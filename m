Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 551DF48D52E
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 10:53:51 +0100 (CET)
Received: from localhost ([::1]:57970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7wnm-000177-EX
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 04:53:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n7wmA-00008m-HP
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 04:52:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n7wm8-0002qh-Ra
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 04:52:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642067527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lV5jSbvCVzBwQ8Z3NvG1xkLwYbb2OCY2TrR8rKrwkd0=;
 b=cHK9yvFS5SGKVPCGSiwlN+3ITbLwoQDF0T2/oBJG4cNv9bIeBKUGYB9JqnvpcHS/bVnejB
 EVvRLwZFR7YObKdKSlESIPpoDUy1q3ILBMJO4H08CIT5xXKfjXiQuAusSyCn7Vq0XDkGsx
 8/vVnUwhU4cgRuF/kLig1n54oMA9U3c=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-427-F1I9Cs63M-SGu-ZMlHy49w-1; Thu, 13 Jan 2022 04:52:01 -0500
X-MC-Unique: F1I9Cs63M-SGu-ZMlHy49w-1
Received: by mail-wr1-f71.google.com with SMTP id
 r10-20020adfa14a000000b001a375e65e60so1005378wrr.2
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 01:52:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lV5jSbvCVzBwQ8Z3NvG1xkLwYbb2OCY2TrR8rKrwkd0=;
 b=rFO3+2WmNvJFby0NzplwU0WvjdC9FCxJAlE74aS1uTRWHppHBozo8+bvMdWziIC2+I
 QbwbX7izp9MPkBgDgvFSvrzqQ/c2vwX4TL4XJJziKKJSmz+z72vMkqHSvY057cvJVwgC
 T6ehyuFLPSTXz2Si+QagpYTZoVXWqqhBNFUkOQlcnugZFXt934ckeL8rabkKO/FyMkBm
 fnXF1pyksmUZv9MJ7qgSe/ilfQn9ptEIW0QxIkQciNdlq2GKOU6J1hilrslPgg6nTuXM
 YhpGIEQEX/8FjTlQVXDKIxJq9fa49TIT7Ecvt4s8KOxJQBDuP+bCSeqjCUK0S9sscGxb
 6Gxg==
X-Gm-Message-State: AOAM533uAwrtF+InRY+NdbKQ+Nyt2xYflzg2tbFinDmStgkZdOl4cjtu
 JEsBb1FBI6I/61U40Viu1oEeE1tRj7EY13DPKpMOEDY6RTmy++jV5nlmPA/vowYzU6x/pOus3Ue
 L6ry4Jr4ZhqMw3/Y=
X-Received: by 2002:a05:600c:3d10:: with SMTP id
 bh16mr3104035wmb.111.1642067520535; 
 Thu, 13 Jan 2022 01:52:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwdVij02+6mq3B8C9alqQqpdr3vr6bcvPLN2bm+3w4tVMO020zk9nPH4nAausETg6E4MGCJcA==
X-Received: by 2002:a05:600c:3d10:: with SMTP id
 bh16mr3104018wmb.111.1642067520279; 
 Thu, 13 Jan 2022 01:52:00 -0800 (PST)
Received: from [192.168.8.100] (tmo-098-68.customers.d1-online.com.
 [80.187.98.68])
 by smtp.gmail.com with ESMTPSA id y8sm2437555wrd.10.2022.01.13.01.51.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jan 2022 01:51:59 -0800 (PST)
Message-ID: <cd41d157-842d-4da9-93e1-7bb6f98c764f@redhat.com>
Date: Thu, 13 Jan 2022 10:51:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 4/6] docs: Add CanoKey documentation
To: "Hongren (Zenithal) Zheng" <i@zenithal.me>, qemu-devel@nongnu.org
References: <Ydhc8cTsH0QNINT/@Sun> <YdheTvpyyiAwDafr@Sun>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <YdheTvpyyiAwDafr@Sun>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, contact@canokeys.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/01/2022 16.37, Hongren (Zenithal) Zheng wrote:
> Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>
> ---
>   docs/canokey.txt | 140 +++++++++++++++++++++++++++++++++++++++++++++++

I think this should likely rather go into the docs/system/devices directory 
instead? And it would be nice if you could also turn it into a reStructured 
text (*.rst) document right from the start.

  Thanks,
   Thomas


