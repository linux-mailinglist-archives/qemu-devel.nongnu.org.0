Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 290ED3E9958
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 22:04:41 +0200 (CEST)
Received: from localhost ([::1]:48610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDuSt-0002DI-LK
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 16:04:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mDuRq-0001Wu-ER
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 16:03:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mDuRm-0004e8-3O
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 16:03:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628712208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0LSddXQAKtDjXJpEtzAXXTUfDQdv06qvNODlBklqblI=;
 b=FInIUeBb4caaCW1Z/UykGZdiqGxBV2GBemxvojyP5VugcX4DVxaGN61BCbADqqOI8b1n3G
 fj1HHeoHSi1HT9hBKYA9vFViRNwE6k8HizDwD4OLFYorHWG2GjshqASYZC2uq22FdTBloV
 GWTirJruSIM8jlPySICueSEZmnfqBxQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-T9ikwh5eMeKERzLqJciDEg-1; Wed, 11 Aug 2021 16:03:27 -0400
X-MC-Unique: T9ikwh5eMeKERzLqJciDEg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 395B31009606;
 Wed, 11 Aug 2021 20:03:26 +0000 (UTC)
Received: from localhost (unknown [10.22.32.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D9EEE189C4;
 Wed, 11 Aug 2021 20:03:25 +0000 (UTC)
Date: Wed, 11 Aug 2021 16:03:25 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Chenyi Qiang <chenyi.qiang@intel.com>
Subject: Re: [PATCH] target/i386: Remove split lock detect in Snowridge CPU
 model
Message-ID: <20210811200325.mj5t542xyvclykzd@habkost.net>
References: <20210630012053.10098-1-chenyi.qiang@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210630012053.10098-1-chenyi.qiang@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Xiaoyao Li <xiaoyao.li@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 30, 2021 at 09:20:53AM +0800, Chenyi Qiang wrote:
> At present, there's no mechanism intelligent enough to virtualize split
> lock detection correctly. Remove it in Snowridge CPU model to avoid the
> feature exposure.
> 
> Signed-off-by: Chenyi Qiang <chenyi.qiang@intel.com>

Sorry I have missed this before 6.1 soft freeze.  I'm queueing
this for 6.2.  Thanks!

-- 
Eduardo


