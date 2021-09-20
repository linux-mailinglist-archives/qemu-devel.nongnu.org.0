Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A60364118E0
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 18:07:59 +0200 (CEST)
Received: from localhost ([::1]:52214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSLpl-0007NL-Tz
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 12:07:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mSLjB-0000Tw-Qe
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:01:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mSLj8-0002nK-1B
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:01:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632153664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k3VQvQGoWy2JJbYO3rDiAf013iUprC/bMj2BbRKcSt0=;
 b=MIQFPqfldGGEW7sN3HWgYP6cEtj3A2J16GbU+cl5MVzSGmx5903kho+kfza0vGnhRLJTtT
 6FM1uxU75MnYl1k0BZoGiugYu1OwVmk78SIoM+IEa9DxYJWqGCk3PxLrI1mo/nQrh3kQ1j
 tCeWkQ8wfVJ4ya0bJv7h5sMjnpJ37eE=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-kZRWm01RO_2VbfxGMB8YRg-1; Mon, 20 Sep 2021 12:01:02 -0400
X-MC-Unique: kZRWm01RO_2VbfxGMB8YRg-1
Received: by mail-qk1-f199.google.com with SMTP id
 t18-20020a05620a0b1200b003f8729fdd04so139833501qkg.5
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 09:01:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=k3VQvQGoWy2JJbYO3rDiAf013iUprC/bMj2BbRKcSt0=;
 b=EBPVRhfpIhqj68N8hkX3OXGR/pfSDHBlmQgEqmEgwN1kuX4geiq+j6sugfdS0nFrbI
 OkYjXmqOnxzPAMrEsZmOoDHETN1vgDpUE+pRFy5/WRJ7+dF80MOuKyqbrke+VSbEe0Qz
 nibhGFEyJAx9tFzZDlNutOeIpyCEWhMsedvr3rNrpmXRMDUu4rlMU9YqLfFpWMCJ+MMc
 663CO5fHt6k9OLmDmHCn4NdNlIwcO81+MbeOZZ25f5MyQ5rm3QWA1Z3bqaPndBDK7D2P
 e22dmp8YEP/WiunqpiAQYvyjEI/6PvoHE2lNs1BVqdlKNLBdTDadT591tlDFPdd7/n2e
 oneg==
X-Gm-Message-State: AOAM533Sa2fbobE2xdASDHfBj4uqgA6nJ1Bvz++brJu5+4PQgpiperMg
 phO2ZOQnocApyY3PGC3/Jy5i+jgl2Vfjc1imF2scrkYM369BJ4lgHOct114+JutN+GoyBzDzMCS
 7dF3g3b4iH+4enmQ=
X-Received: by 2002:ac8:5c08:: with SMTP id i8mr23014627qti.314.1632153661873; 
 Mon, 20 Sep 2021 09:01:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2298b4yEGylpHc+3sAVGXNm8VqK8KVxcOfmXaSZs2dlhhVtoe51Q/t+ilaB/t+CWYHpvuXQ==
X-Received: by 2002:ac8:5c08:: with SMTP id i8mr23014596qti.314.1632153661520; 
 Mon, 20 Sep 2021 09:01:01 -0700 (PDT)
Received: from t490s ([2607:fea8:56a2:9100::d3ec])
 by smtp.gmail.com with ESMTPSA id q84sm1730011qke.3.2021.09.20.09.01.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 09:01:01 -0700 (PDT)
Date: Mon, 20 Sep 2021 12:00:59 -0400
From: Peter Xu <peterx@redhat.com>
To: Hyman <huangy81@chinatelecom.cn>
Subject: Re: [PATCH v12 0/6] support dirtyrate at the granualrity of vcpu
Message-ID: <YUiwO74nv3NE9Gkj@t490s>
References: <cover.1624982116.git.huangy81@chinatelecom.cn>
 <8c6a08c3-7de2-1e93-2119-18dfaa3fd397@chinatelecom.cn>
 <4e5b2069-dfac-99b4-d7fa-57bf5ceb0a4e@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <4e5b2069-dfac-99b4-d7fa-57bf5ceb0a4e@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.475,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Chuan Zheng <zhengchuan@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 20, 2021 at 11:45:21PM +0800, Hyman wrote:
> 
> 在 2021/8/30 7:11, Hyman 写道:
> > ping - hi, what would you think about this patchset ? :)
> ping again, just make sure this patchset not be ignored,
> any advice or comment are welcome. :)

Thanks for following this up, Yong.  Yes, I keep thinking this series (and
actually the other series to enable dirty log dirty measurement) is a nice
thing to have, and worth merging.

-- 
Peter Xu


