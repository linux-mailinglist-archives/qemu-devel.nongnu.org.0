Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F27E532B80A
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 14:33:51 +0100 (CET)
Received: from localhost ([::1]:50260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHRdP-0004uE-18
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 08:33:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lHRb7-0003Lv-8P
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 08:31:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lHRb5-0003qQ-Jj
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 08:31:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614778286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dhKqxKBFkaOlQ3sPGBNWkfrkyTGxOiVdwNieGuR7XW0=;
 b=fk3h1b06/EKuxzUoKff+6cSZvXJ7F/SvujjJLBjkOvA58tYrYog7E58USlyUFkl5FA6lPN
 fb9zYcPDEHSvbROEVoP0/H7ymUPppZaQOuVQCHgYPxhA1A5N2eGVwxTH9KzBCILg98Io6N
 K5tUkKtesMPmSTrM18dUIQEtlDdczXw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-GknLCEs9PLKymz4cClIhpQ-1; Wed, 03 Mar 2021 08:31:25 -0500
X-MC-Unique: GknLCEs9PLKymz4cClIhpQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7438800D53;
 Wed,  3 Mar 2021 13:31:23 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-115-146.ams2.redhat.com [10.36.115.146])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C7D085D9DD;
 Wed,  3 Mar 2021 13:31:14 +0000 (UTC)
Subject: Re: [PATCH v1 1/2] s390x/kvm: Get rid of legacy_s390_alloc()
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210303130916.22553-1-david@redhat.com>
 <20210303130916.22553-2-david@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <93a30708-e893-208b-3dd3-c8b617272966@redhat.com>
Date: Wed, 3 Mar 2021 14:31:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210303130916.22553-2-david@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: kvm@vger.kernel.org, Cornelia Huck <cohuck@redhat.com>,
 Peter Xu <peterx@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/03/2021 14.09, David Hildenbrand wrote:
> legacy_s390_alloc() was required for dealing with the absence of the ESOP
> feature -- on old HW (< gen 10) and old z/VM versions (< 6.3).
> 
> As z/VM v6.2 (and even v6.3) is no longer supported since 2017 [1]
> and we don't expect to have real users on such old hardware, let's drop
> legacy_s390_alloc().
> 
> Still check+report an error just in case someone still runs on
> such old z/VM environments, or someone runs under weird nested KVM
> setups (where we can manually disable ESOP via the CPU model).
> 
> No need to check for KVM_CAP_GMAP - that should always be around on
> kernels that also have KVM_CAP_DEVICE_CTRL (>= v3.15).

Reviewed-by: Thomas Huth <thuth@redhat.com>


