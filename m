Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD76644E6F
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 23:15:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2gCA-00006s-So; Tue, 06 Dec 2022 17:13:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p2gC8-00006P-SS
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 17:13:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p2gC7-000376-5h
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 17:13:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670364820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GCxJsqm3B5niSMfDCCMqTp9TE2pbHvPXI836pHEzEMQ=;
 b=gXzswP4Fl5tcE/nJPUt3qC7oqCdO9rpowKn7ds1hN8WfzVusjzNjMfHBikc3Udl9HFeqR5
 4zX+YV50lFixDfYFZf1OQWaQfC06TAJd4OcY248JgpELbyZF1cuyZ4gtI6tibtKJytAZOP
 WDfmzmPUEQoGFaqKRE6lbpRdWe8UCz8=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-287-_OGqcjM5Pey_P-s8UMsqgA-1; Tue, 06 Dec 2022 17:13:36 -0500
X-MC-Unique: _OGqcjM5Pey_P-s8UMsqgA-1
Received: by mail-qk1-f197.google.com with SMTP id
 bs7-20020a05620a470700b006fac7447b1cso22685193qkb.17
 for <qemu-devel@nongnu.org>; Tue, 06 Dec 2022 14:13:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GCxJsqm3B5niSMfDCCMqTp9TE2pbHvPXI836pHEzEMQ=;
 b=7oh9ZySHa/IeLW/uXlOJz1uJSN4cFcyMZIQqHIUEPOHKhRh5BJru1tgtNsE6YCsj98
 iwLNSskwa1RoL+fVLiiV0Bvo0VaxOF1aVNMJ4uxImVj/b+3E9GMhcIagiRPjH7P45DnB
 yArRavXfw0BkW/EsoSGQj/OSir71l8oPc/ngDPF6Z8GAwKYdbaEgHjSa9Ezgg0turhgt
 heg/iwVStfswixlBcHDftj1OTjdz7YbT35EIm9tUMa0jWcRCIg+uZ9Dr7KVHW8SZdKh0
 0u268ec8X9e7xEcnEDNWBCDEPd/a3H4vvOqlg7uWZiyGAsJehHBj2o881maES1iKegjn
 vsDQ==
X-Gm-Message-State: ANoB5pkySR/l08HS+vNAmOz8z66wKeE7RTFOhK8tyXi6irBXnXOyd1D7
 RJw3PPBwtTtu/U3m+WHCn4S4wE/KL/qu9eLdEEECIpvM/XAvI+ChnUFxfnOtOxUAftlpCtHP39o
 cIk5YWVm9Aaoxfdz4AaSj75A4M1CkdWLxX329SMz8HKQwP2X/bJwadUa44FVj4jAg
X-Received: by 2002:a05:6214:18f2:b0:4c7:4c9b:fdc2 with SMTP id
 ep18-20020a05621418f200b004c74c9bfdc2mr452717qvb.27.1670364814251; 
 Tue, 06 Dec 2022 14:13:34 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7X6RjPPN4N0oypXXtQ/yvr/DnD+jDH59P9efwZblht5BCV8OGlr5eMOlTkIYgn403RFuVVpg==
X-Received: by 2002:a05:6214:18f2:b0:4c7:4c9b:fdc2 with SMTP id
 ep18-20020a05621418f200b004c74c9bfdc2mr452708qvb.27.1670364813976; 
 Tue, 06 Dec 2022 14:13:33 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 dt4-20020a05620a478400b006fc9847d207sm15378169qkb.79.2022.12.06.14.13.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Dec 2022 14:13:33 -0800 (PST)
Date: Tue, 6 Dec 2022 17:13:32 -0500
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Yi Liu <yi.l.liu@intel.com>, Eric Auger <eric.auger@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v2] intel-iommu: Document iova_tree
Message-ID: <Y4++jGnxyjnwe0Qx@x1n>
References: <20221206221039.395356-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221206221039.395356-1-peterx@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

On Tue, Dec 06, 2022 at 05:10:39PM -0500, Peter Xu wrote:
> It seems not super clear on when iova_tree is used, and why.  Add a rich
> comment above iova_tree to track why we needed the iova_tree, and when we
> need it.
> 
> Also comment for the map/unmap messages, on how they're used and
> implications (e.g. unmap can be larger than the mapped ranges).
> 
> Suggested-by: Jason Wang <jasowang@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
> v2:
> - Adjust according to Eric's comment

This is the old version.. sorry, will repost.

-- 
Peter Xu


