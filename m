Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7B345EA79
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 10:36:05 +0100 (CET)
Received: from localhost ([::1]:40180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqXeG-0007Bz-1M
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 04:36:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mqXd2-0006PX-PV
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 04:34:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mqXcz-0005nz-Rs
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 04:34:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637919283;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=8lMwXO12rS7901eYPeMFCa3FhjfBR3yU9RA87bVMSyg=;
 b=e03W0qGcDvfS7U3C/wn9OPbPUB3qs/6hCpiZBU/nkbaJGXIsNmQLLmLuI2n0TVr3cHG7dB
 /SFpXNdRLzVOdXwCGf7dd0sO4dFMUswxF35S/a89zKm0+Nm9Ni8CR4Ocq6n+U6z+a0CQAi
 U5+eAjXi07C5jyq34qfc63ocftOJ5IQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-385-yvch6jyjPO27_rwPULGIVA-1; Fri, 26 Nov 2021 04:34:42 -0500
X-MC-Unique: yvch6jyjPO27_rwPULGIVA-1
Received: by mail-wr1-f71.google.com with SMTP id
 q17-20020adff791000000b00183e734ba48so1571594wrp.8
 for <qemu-devel@nongnu.org>; Fri, 26 Nov 2021 01:34:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=8lMwXO12rS7901eYPeMFCa3FhjfBR3yU9RA87bVMSyg=;
 b=sb5ZMLZAybCaYPIDX4NWxrALLPOB6U+NhFX16qpbo65BQ79AQhJFhmOl4kfnbkFAET
 oV4VETt69QDVrLm7E97yAyP1KQNEnyVM3zzeWlD/ClLyq1rSYMFCGGBK3Jg2/JH0Iwdx
 OeTiffMljfwxBob4pKK8PItZ5nOtzsf74zHWavGXAThMny/EnkbpKDKYg4BOffsYpX/I
 b+vcWZY4myF4sgXbGbSNL6ev+ZMAvQTVxnQwIbSYCN/GyOe0PajU1WbM6qoHULLB8sbR
 DuLHK+aw/KzwxIDo9pLtT3mtOptEdC0NaAPphcA7OiqKh+vsidasHRcu73ENFqa/yd1u
 BV2A==
X-Gm-Message-State: AOAM531EJENhT0yft/5aNhfCWaxMhO3ssdzYYCPa1ROjiSfycKxSXAnE
 59kYqHNQ0GNWF43QloaApcA4LB8UDTBy4COb45ZM37y+4Kk4Atxj5nb5CmpYyAVUScH7613/GV7
 dwsZkUofrn1ZdY58=
X-Received: by 2002:adf:fb06:: with SMTP id c6mr13105788wrr.625.1637919281294; 
 Fri, 26 Nov 2021 01:34:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw+ZyTRMCRdccdwfNROeCQO1hQe867HTbOETBR3M6ba/ItpOrpfEsX5fRKKznx8eP0/DQdQQQ==
X-Received: by 2002:adf:fb06:: with SMTP id c6mr13105765wrr.625.1637919281102; 
 Fri, 26 Nov 2021 01:34:41 -0800 (PST)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id x4sm9939769wmi.3.2021.11.26.01.34.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 01:34:40 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v3 04/23] multifd: Add missing documention
In-Reply-To: <YZ/YFQxtw+ZCkuFu@work-vm> (David Alan Gilbert's message of "Thu, 
 25 Nov 2021 18:38:13 +0000")
References: <20211124100617.19786-1-quintela@redhat.com>
 <20211124100617.19786-5-quintela@redhat.com>
 <YZ/YFQxtw+ZCkuFu@work-vm>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Fri, 26 Nov 2021 10:34:39 +0100
Message-ID: <87mtlr6z0w.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: quintela@redhat.com
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> * Juan Quintela (quintela@redhat.com) wrote:
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>
> Pretty obvious, but I guess to have the complete set of comments:

Yeap.  When I was removing the used parameter, I found that we have this
function without the comment.  If we have the comments, just make them
right.

> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Thanks, Juan.


