Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3494308FED
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 23:19:44 +0100 (CET)
Received: from localhost ([::1]:49768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5c7D-0007TQ-2l
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 17:19:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1l5c67-00071o-Ir
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 17:18:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1l5c63-0005nD-Fk
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 17:18:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611958708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JesRkvhNdw8EiJurQTKzcPC6dJcgGs6L106+Q/NTJBI=;
 b=Ym62w7/sru2r3iwUfuy6K71KAFQkD1ql/zP2tDij1Upa73UdIsU4de6MJJk1uqD677ui/q
 EiZjE9tQ4qktAKFTaWC08nOKTFCRSS3c5ZrLAfTt9tXGqEYt09w++56GpS9KaGhGJ4n+xg
 ZTH4Q8z1Mc16RFMcUCVgI8COUBk5kEY=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122---Ez0_IAPd-JFRuwNx1aFA-1; Fri, 29 Jan 2021 17:18:26 -0500
X-MC-Unique: --Ez0_IAPd-JFRuwNx1aFA-1
Received: by mail-qt1-f198.google.com with SMTP id d1so7049097qtp.11
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 14:18:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JesRkvhNdw8EiJurQTKzcPC6dJcgGs6L106+Q/NTJBI=;
 b=PxkTMTxnqYN07n4N5ePq5663AIiKSZHlmMaWE1x2tyKv8fwLYXG/WdhNv8A/EvE3Vp
 Z9oaE4J34vTVuGcM2cHrZLFtrl5NUSi1WgK1Puvp/39F9SxSLKuqgz+em805PgBWmp5f
 j4m7Z5MhWt9/IFrlSKU9cfUc1/Miym8Ux3AsuWak+G4e+2PVPe1OoD0ojFwyCHmjKkiw
 OhE+KF8DqFyzhPtL/5WlcjAj9JOSOj2mKdBf7azwjNkiJ3COC6kEj+Qnf0YrPEnrG+0A
 wdvf6J3BUbnLk9B9YRhqGp+3UGAPcJCwxTQcFubvUMSadVMnDZBh4HBcdYAC1Ds/82R5
 VTkA==
X-Gm-Message-State: AOAM530ZByCGfekBnbbT24ZWT0tD+waQ7/wPmyaV4atIpoxcwnQfBCt1
 XPtKPLE3yLmxULglVy3uxvrbskz+/3XSjajjkalPTP/yATNhg5O//Gopq4C+50CEvfSD8NfaG1z
 YcOkdJw6x6XPywIM=
X-Received: by 2002:a0c:c38e:: with SMTP id o14mr5969121qvi.29.1611958705981; 
 Fri, 29 Jan 2021 14:18:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzUbWqUlTEmi+b1PPmmq/ziDchD3EGgODD2P5vmmUivVJWMBc6euUW4d32qxQTpWRy/dLAb1g==
X-Received: by 2002:a0c:c38e:: with SMTP id o14mr5969108qvi.29.1611958705807; 
 Fri, 29 Jan 2021 14:18:25 -0800 (PST)
Received: from xz-x1 ([142.126.83.202])
 by smtp.gmail.com with ESMTPSA id z5sm6990903qkc.61.2021.01.29.14.18.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 14:18:25 -0800 (PST)
Date: Fri, 29 Jan 2021 17:18:23 -0500
From: Peter Xu <peterx@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 1/2] pci: reject too large ROMs
Message-ID: <20210129221823.GA260413@xz-x1>
References: <20210129192838.582771-1-pbonzini@redhat.com>
 <20210129192838.582771-2-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210129192838.582771-2-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: mst@redhat.com, lersek@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 29, 2021 at 08:28:37PM +0100, Paolo Bonzini wrote:
> get_image_size() returns an int64_t, which pci_add_option_rom() assigns
> to an "int" without any range checking.  A 32-bit BAR could be up to
> 2 GiB in size, so reject anything above it.  In order to accomodate
> a rounded-up size of 2 GiB, change pci_patch_ids's size argument
> to unsigned.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


