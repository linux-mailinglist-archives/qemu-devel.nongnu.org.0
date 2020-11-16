Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B2C2B4408
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 13:53:02 +0100 (CET)
Received: from localhost ([::1]:52474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kee0D-0000lt-Et
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 07:53:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kedyb-0008CV-8W
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 07:51:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kedyZ-0004Dt-NO
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 07:51:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605531078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g0SydAvbxjMTvugtDImHbAVQ8wSyiM9uvdrkFGX/8UA=;
 b=YyK86puen/bL4WcyTDxu0gcW1pYE8ej7ZghEMBW6t5dGy4W/VHquS9ZTJeD5lQsetCnRCA
 Ha9V0/mxGJYzv/xVWNgiV0Q/xIgE8jDGkmkJiQJzxa8NT7LVJG3qH/gpJ2zyjDtpzFx9Wt
 zWhiUw6ys8SYSGNETrE9ukIOI+rK9LI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-qcqpg-MGME-fY297gExWJw-1; Mon, 16 Nov 2020 07:51:17 -0500
X-MC-Unique: qcqpg-MGME-fY297gExWJw-1
Received: by mail-wr1-f72.google.com with SMTP id f4so11081845wru.21
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 04:51:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=JOe2HWkSmt0fhGkcCbCemujxluwzAojByihZjfB43TI=;
 b=fHW2nVQsr0bMKX0hvO2XVp6CQvsJ6SCaED/zf5mssULCm7aR/4z5ROiHLSnTpBW8jc
 dwl0DxDo0fdf7Ng+J8+Cjo4xvVkttO+5wh+1SZMpcEobUTE5ruLW1m/HPMeyR06+TdgP
 fGKbuu/uv/aw+4XHm/ngTn0JVYGg5Iiat+22v2edD2jkujYf8aPtGxsS2ut7U2MAS/Q/
 eYFcjGLSJlIZ+1ZiSuEXi0OlStJ18U43a8Xgs0scpqNa2uY+mkduJIzyEOwmdMH/TsMD
 O5LaBv5nWL/e+6TTWkYvrZUI6e6hu4W8KQGzGkI7hJY0XXv4qIZefDT8R8cHSCIDT+M1
 97Dg==
X-Gm-Message-State: AOAM533OLjECTatLlt0nkTHWRfYUDZhmLF54WwLzq7AdkQY6gInrMfgI
 iN3S3Z1KVm4nzPj26cBwN+H2x5iHpL146dwnrtUi7GAuA+EB6vZlLg4RWlaOt34B3J7nl3aDznw
 9Lojl6qaRpqcSoBk=
X-Received: by 2002:adf:a3c1:: with SMTP id m1mr18728778wrb.28.1605531075867; 
 Mon, 16 Nov 2020 04:51:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzKv/QYDGGbQx/O3vEz4FvWVFLDDdaaITeRrfkcqOAUi/d20gFeICwWzLuMJNhDqT4dbLXtAw==
X-Received: by 2002:adf:a3c1:: with SMTP id m1mr18728748wrb.28.1605531075638; 
 Mon, 16 Nov 2020 04:51:15 -0800 (PST)
Received: from redhat.com ([147.161.8.56])
 by smtp.gmail.com with ESMTPSA id 30sm15852966wrd.88.2020.11.16.04.51.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 04:51:14 -0800 (PST)
Date: Mon, 16 Nov 2020 07:51:06 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [RFC v3] VFIO Migration
Message-ID: <20201116074748-mutt-send-email-mst@kernel.org>
References: <20201110095349.GA1082456@stefanha-x1.localdomain>
 <64fb6a41-fbfa-994c-9619-4df41ac97fde@redhat.com>
 <20201111143615.GA1421166@stefanha-x1.localdomain>
 <20201111154850.GG906488@redhat.com>
 <20201116111524.GD96297@stefanha-x1.localdomain>
 <20201116114125.GE104771@redhat.com>
 <20201116065906-mutt-send-email-mst@kernel.org>
 <20201116120518.GH104771@redhat.com>
 <20201116072805-mutt-send-email-mst@kernel.org>
 <20201116124549.GI104771@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201116124549.GI104771@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 22:35:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: John G Johnson <john.g.johnson@oracle.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, Yan Zhao <yan.y.zhao@intel.com>,
 quintela@redhat.com, Jason Wang <jasowang@redhat.com>, "Zeng,
 Xin" <xin.zeng@intel.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Felipe Franciosi <felipe@nutanix.com>,
 Christophe de Dinechin <dinechin@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 16, 2020 at 12:45:49PM +0000, Daniel P. Berrangé wrote:
> > This won't work for devices: same device needs to work with
> > both upstream and Red Hat and migrate upstream-upstream and Red Hat-Red Hat
> > (though not upstream-Red Hat).
> 
> That's fine, we can cope with that. It simply means whomever owns
> responsibility for maintaining the code has to be more careful about
> changes they make in their downstream.

When we are talking about device vendors, "has to be more careful"
equals broken code. We need to make things super easy
for vendors doing the right thing, like publishing the migration
format, including a standard place to publish it and a tool
that uses that info to make migration just work.

-- 
MST


