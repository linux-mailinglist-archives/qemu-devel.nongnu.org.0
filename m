Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9599F2A4BD9
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Nov 2020 17:46:07 +0100 (CET)
Received: from localhost ([::1]:59184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZzRe-0000e6-JI
	for lists+qemu-devel@lfdr.de; Tue, 03 Nov 2020 11:46:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kZzQK-0000Ab-Q1
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 11:44:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kZzQJ-0001yJ-7z
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 11:44:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604421882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dChcepkj+kquwMZraOge1BUHjgvAsNON/WEIwrn4gF0=;
 b=Y6gsYrrUDlQwP020QRwjqIlDdv9gTIAHU0vyCKQiw4VigNhEwN/Fb4TtQzDSZATztO+tHv
 QVX6/9gbNglJkcFB/LE2jgBREeIRYbA8F+BYi/P/I++gx+yP4Nv8P77YhXliNC5Ulxra5t
 9tSzjbpp5/429oo5Ml7cKH8Yc2Wo7SM=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-0_QIjkrtPSWFUD2cQ2GZTw-1; Tue, 03 Nov 2020 11:44:40 -0500
X-MC-Unique: 0_QIjkrtPSWFUD2cQ2GZTw-1
Received: by mail-qk1-f197.google.com with SMTP id x5so11169815qkn.2
 for <qemu-devel@nongnu.org>; Tue, 03 Nov 2020 08:44:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dChcepkj+kquwMZraOge1BUHjgvAsNON/WEIwrn4gF0=;
 b=h8m5Hd3KsG5OchcvBj4jMSrVVP1wpBFbHLYVnUlt/77QlYhwokSC5nfsbe4I1XGxW/
 C9mhiWIbca2fwfxZZ9u1shx0noyZdbQ60oYZDEs2+BCZX6YF+z4t2DZ+afDOjjmjsbQf
 4Q6XwXO+hDu/h/Do+6ThPgKp8rMIk74weX6J8e7ANzbNxpZSAoHyfE6HFmGN0FyCZtiX
 OoiVDm2KTDcLqcdQFJFH+Vj2RtsOPXDWl8IfKTwkvpw+HPW+TBlBu3wXxlS43HxBwG6Y
 f/Aat4r1hZUdN9SVFflTOE4owny/iew2q86aOTWXafGbXcutHV7bwd+iePCefZcXX90J
 +bvQ==
X-Gm-Message-State: AOAM530CV7OLuyW9+FabXhpMMsqjemRI/8wjssIIj/bLQTcK7G9w4VKL
 UldvuTbGFyHKDtk9I81jhy8IX0PuroZpOK8kFjVKGWuWP+cbcpX6/vbRk1UuxVdQXHImdcjhrHV
 ahlwy3CqBWfRw8IY=
X-Received: by 2002:a37:e213:: with SMTP id g19mr20899739qki.147.1604421880510; 
 Tue, 03 Nov 2020 08:44:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwVy2gUWv8WaUPQ6DMeYkt49hlJh49ILySSah21Oyw8eC/M9weoS/NlSJhC3jEDPxKSmev/vg==
X-Received: by 2002:a37:e213:: with SMTP id g19mr20899718qki.147.1604421880309; 
 Tue, 03 Nov 2020 08:44:40 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-20-174-93-89-196.dsl.bell.ca. [174.93.89.196])
 by smtp.gmail.com with ESMTPSA id m26sm10713321qka.118.2020.11.03.08.44.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 08:44:39 -0800 (PST)
Date: Tue, 3 Nov 2020 11:44:38 -0500
From: Peter Xu <peterx@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v11 09/10] virtio-iommu: Set supported page size mask
Message-ID: <20201103164438.GI20600@xz-x1>
References: <20201030180510.747225-1-jean-philippe@linaro.org>
 <20201030180510.747225-10-jean-philippe@linaro.org>
 <20201102224725.GF20600@xz-x1> <20201103163234.GB6723@myrica>
MIME-Version: 1.0
In-Reply-To: <20201103163234.GB6723@myrica>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 00:03:41
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
Cc: mst@redhat.com, qemu-devel@nongnu.org, eric.auger@redhat.com,
 alex.williamson@redhat.com, pbonzini@redhat.com, bbhushan2@marvell.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 03, 2020 at 05:32:34PM +0100, Jean-Philippe Brucker wrote:
> > In summary:
> > 
> >     if (qdev_hotplug) {
> >         if ((new_mask & cur_mask) == cur_mask) {
> >             /* Superset of old mask; we're good.  Keep the old mask since same */
> >             return 0;
> 
> That looks correct, but a bit too restrictive. If we start with
> cur_mask = 0xfffffffffffff000, and we hotplug a VFIO device with
> new_mask = 0x40201000 (4k page, 2M 1G blocks), then this code rejects it
> even though it would work.

Yeah I think you're right - it should be the smallest granule that matters the
most.  Thanks,

-- 
Peter Xu


