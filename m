Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D13A2652362
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 16:02:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7e8V-0007wd-6e; Tue, 20 Dec 2022 10:02:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p7e8T-0007uy-MU
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 10:02:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p7e8S-0005h4-8o
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 10:02:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671548547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uvwU1XdrYP8cZfyHLujQxW/MLYzSnoGTOm0DP1stX4U=;
 b=ACMZmW9JJKnGIwm5iaCJsm139xgRzsKihGBi8iGpqN/AA6yhErSzTtthC5yg61XxQbuDm4
 OyJ2/+at9Jc/5QBNqGW9L5Cyoa6/qPm265ha58P1Y74PRx4Y1FPqTxgBXANpN3+A7ypk23
 IdfvLVcU6ApRCA8INEhrcVQoDj1impY=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-562-alwqjx0LPdag6D1ViXD7aQ-1; Tue, 20 Dec 2022 10:02:26 -0500
X-MC-Unique: alwqjx0LPdag6D1ViXD7aQ-1
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-14c6a6ff8d8so169787fac.1
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 07:02:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uvwU1XdrYP8cZfyHLujQxW/MLYzSnoGTOm0DP1stX4U=;
 b=pxBlRVDgISPeYtU6dbBbnoGP6Bijcc5PZwy1mv6fhanM4/XeNo8URQ3yLIfRJADKLK
 Jgr7AZggNsT/DihKwpjNrCcSozaOt8FeBauMfXow1VfTfnBZfHKg/zd/v9xHdo3l8gFW
 ySWJDVOdW39hly/BUlaco/AiIWbWSOGhdiEmU+/SIIWsQyb2y6umR9Tl0oOou1DCrYTw
 n/SPTUixfEdHCRXMXe8AGad8DZxWIH/8H/y3RriJEa4iItWZvU7cK/LPclCjfZRAp2nx
 G7WPGqVR1rHUUhZhF4dftRKa9tRoJpbKEvKi0eZKDXgZU6aUwP33yfGdAi6eRs700UYq
 xohA==
X-Gm-Message-State: ANoB5pkfaYvtEhJIObhgVE7glo5d80Tn7qD+73XxAoFKw6ZZvwbP5t5E
 RqDidGuo7PNRHiBflLMte0q2Xjj23rFSh5YgOhO1+kWBhA1/dScCl8yd/8blMF1CbqVYV0ZbD3M
 lDQK9uYMyibt/koI=
X-Received: by 2002:a05:6871:691:b0:144:7d7a:a97 with SMTP id
 l17-20020a056871069100b001447d7a0a97mr23618082oao.11.1671548544204; 
 Tue, 20 Dec 2022 07:02:24 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7Y03siinoGzTXLV3moFyapmTmt1UGPYduFq2CBwD/af9YpDcNhaKNU6P5RIROuvyhC0bT3Qw==
X-Received: by 2002:a05:6871:691:b0:144:7d7a:a97 with SMTP id
 l17-20020a056871069100b001447d7a0a97mr23618019oao.11.1671548543502; 
 Tue, 20 Dec 2022 07:02:23 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-45-70-31-26-132.dsl.bell.ca.
 [70.31.26.132]) by smtp.gmail.com with ESMTPSA id
 x21-20020ac85395000000b003a50248b89esm7618162qtp.26.2022.12.20.07.02.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 07:02:22 -0800 (PST)
Date: Tue, 20 Dec 2022 10:02:20 -0500
From: Peter Xu <peterx@redhat.com>
To: Chuang Xu <xuchuangxclwt@bytedance.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 dgilbert@redhat.com, quintela@redhat.com, pbonzini@redhat.com,
 david@redhat.com, f4bug@amsat.org, mst@redhat.com, zhouyibo@bytedance.com
Subject: Re: [RFC v3 1/3] memory: add depth assert in address_space_to_flatview
Message-ID: <Y6HOfEw+FZc3/lbu@x1n>
References: <20221213133510.1279488-1-xuchuangxclwt@bytedance.com>
 <20221213133510.1279488-2-xuchuangxclwt@bytedance.com>
 <CAFEAcA8bD7SnHTL8r0cwjdUOJ4katcdgSqkLnknp1++JT5CKjg@mail.gmail.com>
 <CALophuuPzKr6qX_TMJLQFRrRmVOHtv=FAnwXFZPFTTn0iuESDw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CALophuuPzKr6qX_TMJLQFRrRmVOHtv=FAnwXFZPFTTn0iuESDw@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Dec 20, 2022 at 06:28:40AM -0800, Chuang Xu wrote:
> Yes, Maybe we should add a function to acquire the value..

Or making it non-static would work too.

-- 
Peter Xu


