Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9674F2930A8
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Oct 2020 23:38:47 +0200 (CEST)
Received: from localhost ([::1]:37176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUcre-0004H3-Cf
	for lists+qemu-devel@lfdr.de; Mon, 19 Oct 2020 17:38:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kUcpI-0003Or-3X
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 17:36:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kUcpG-0003er-IK
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 17:36:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603143377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9ic7dwW4v2yK/+r4XxQGsIoM+/TKTAGvuqpRZuZMoWw=;
 b=PHpHB1f8QricyLWm79VvG88jbXxaRpSzTG7399A261c8O2ppb8aKttFqRjzf46KIAziFsP
 B6+e9huR2aL0cXZZRLlGNLoOxWT/HC4i8E5B9t8uADuLSNUrgadzGz4H7+YgWLnstzUlj/
 FZuLdY7UA7qirybfshaBB6CQBKdR0iQ=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-8OOVCAL6M_yV1dijCbDGGw-1; Mon, 19 Oct 2020 17:36:16 -0400
X-MC-Unique: 8OOVCAL6M_yV1dijCbDGGw-1
Received: by mail-io1-f70.google.com with SMTP id q126so1193504iof.3
 for <qemu-devel@nongnu.org>; Mon, 19 Oct 2020 14:36:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9ic7dwW4v2yK/+r4XxQGsIoM+/TKTAGvuqpRZuZMoWw=;
 b=Tu6+T2S70BlJGS7dCFhMinp9VjFQfhsYEEi2Cu589W6rMsWkgZ+Fs3g/nFfDyw1Nkg
 DtTrYyLX1ufm5ZuRYIhnqpMojVQKIZX2QOUfTEKb1vgTkprocUvta9HldOm/5YoihUcD
 k9ML8nMZfjoKO4VhHLhb0DxluyGtv2jJn6qbhdAb3cuFLQmfqI48THaEekwECX7xd5YH
 TAGIp+YcBylxc3itflsNisl8Fd6XZmE/9gh4t3zOXlKD191X8PM2V1nCLR2lvISfP1iv
 3HMqYlIprFtuIbLgmf7t5HSHAURz2hYc/diaDLVgQC1npYvypmgrbolZU/vo2MnykuN4
 agLA==
X-Gm-Message-State: AOAM530Gm+EbtCEzzmRXfulohG1LdZmMMMLqG6zELSPSFq/jq7TFS7QP
 ET+8SguBFfRObX1R+jTDJ5GRNL1n/HXCxDEcynAKWo/NMbXyB1vNP/I8RFKqX36akFKk/ZkvC5D
 pEErzvBXlgqNUQ2Y=
X-Received: by 2002:a6b:8b0b:: with SMTP id n11mr1317240iod.66.1603143375271; 
 Mon, 19 Oct 2020 14:36:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzz2HRuJInMtHPtiGPXALtUV4O0dkPc9PGpWhWW422XYBQA/g7ocnwixwa0UZ1XM81FnuMlkA==
X-Received: by 2002:a6b:8b0b:: with SMTP id n11mr1317236iod.66.1603143375132; 
 Mon, 19 Oct 2020 14:36:15 -0700 (PDT)
Received: from xz-x1 (toroon474qw-lp140-04-174-95-215-133.dsl.bell.ca.
 [174.95.215.133])
 by smtp.gmail.com with ESMTPSA id z21sm755853ioq.35.2020.10.19.14.36.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 14:36:14 -0700 (PDT)
Date: Mon, 19 Oct 2020 17:36:13 -0400
From: Peter Xu <peterx@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v10 01/10] virtio-iommu: Fix virtio_iommu_mr()
Message-ID: <20201019213613.GD3203@xz-x1>
References: <20201008171558.410886-1-jean-philippe@linaro.org>
 <20201008171558.410886-2-jean-philippe@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20201008171558.410886-2-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/19 02:32:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: mst@redhat.com, qemu-devel@nongnu.org, eric.auger@redhat.com,
 alex.williamson@redhat.com, pbonzini@redhat.com, bbhushan2@marvell.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 08, 2020 at 07:15:49PM +0200, Jean-Philippe Brucker wrote:
> Due to an invalid mask, virtio_iommu_mr() may return the wrong memory
> region. It hasn't been too problematic so far because the function was
> only used to test existence of an endpoint, but that is about to change.
> 
> Fixes: cfb42188b24d ("virtio-iommu: Implement attach/detach command")
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


