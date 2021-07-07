Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3303BEC85
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 18:47:00 +0200 (CEST)
Received: from localhost ([::1]:49064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1AhP-0003e8-Ac
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 12:46:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m1Afw-0001yA-OX
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 12:45:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m1Afv-00065o-CT
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 12:45:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625676326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0Ow/CVQJo1CSvOZKtoc12ZmW2mmTmUVUN47FbF3wA9E=;
 b=eAMuC/gLQR1joL6nL71R3tvlhBK7XL3NxVh1UXrRRlJP5VgsFVbTW9UbLeo5o6Aiw7V0Cb
 nQexOvUNPoy0BRPnVE2Q+YtIV5kelhGd+RSVjsEcQoOV+H+GO8ykphM2UcAJtFJZdlGNTs
 CUa1g/+dIM2oZcJNHmf2xymwoigXtFM=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-vu21jVutMaGORTtIHEwdxw-1; Wed, 07 Jul 2021 12:45:25 -0400
X-MC-Unique: vu21jVutMaGORTtIHEwdxw-1
Received: by mail-qv1-f70.google.com with SMTP id
 k12-20020a0cfd6c0000b029020df9543019so2024282qvs.14
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 09:45:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0Ow/CVQJo1CSvOZKtoc12ZmW2mmTmUVUN47FbF3wA9E=;
 b=QzoHGUUTu5vZ5AKyC1q+UqhVkemLJPy2Ow/UoXfNnHDFEdUjma830BCGRGQlsA0J6p
 fU48ti8lSSyDL/iJCcaNe+1xsdlUCd3VTmioFulsgY4wMVrJSirA2s/dkk1q8J61+Z0l
 oJBJgCN8s95+XrWakQMl4aY2x7THErBiBc0SKZMyWlMaVpYr4S9gVkYsyR4qK+bCoQwD
 XQXnXLRvmU5UsK2at4Y180mt08wtza+s5PNlZLnoLLImv9rrLctALquyUopb0CKVQrgF
 ghfTZTv/cyPaHdUytKSjgY9EMPi59i9sGJ5MXZcKZw8iA06oEEyhw7NwvRUCg8SYYnfr
 JMQA==
X-Gm-Message-State: AOAM5324u5BzMzd5Fs9y1cUsnAbPmeyVKOjnTjUZlzTLV4Ww5h0lFQpi
 yZ+qIEy7nUFODlH8mwdi44c27iF2KlqFtnrNHkLGgxPz6Qdou9XkMKDO77CwBip7w8mkQqeyOG/
 qklQjxOQyOakI8do=
X-Received: by 2002:a0c:e087:: with SMTP id l7mr24712885qvk.22.1625676324574; 
 Wed, 07 Jul 2021 09:45:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxclvtIRABS0nP5m723CMkQaBaAVSkcGdnfGDH4OiiiVT47rk3zIEpl+knprFZQ5bvRYYBapw==
X-Received: by 2002:a0c:e087:: with SMTP id l7mr24712864qvk.22.1625676324402; 
 Wed, 07 Jul 2021 09:45:24 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id u22sm2796950qkp.85.2021.07.07.09.45.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 09:45:23 -0700 (PDT)
Date: Wed, 7 Jul 2021 12:45:22 -0400
From: Peter Xu <peterx@redhat.com>
To: "Wang, Wei W" <wei.w.wang@intel.com>
Subject: Re: [PATCH] migration: Move bitmap_mutex out of
 migration_bitmap_clear_dirty()
Message-ID: <YOXaIlPxHSlINjiz@t490s>
References: <YN26SDxZS1aShbHi@t490s>
 <304fc749-03a0-b58d-05cc-f0d78350e015@redhat.com>
 <604935aa45114d889800f6ccc23c6b13@intel.com>
 <824a1d77-eab0-239f-5104-49c49d6ad285@redhat.com>
 <562b42cbd5674853af21be3297fbaada@intel.com>
 <a5877d58-d501-0ff6-676b-c98df44d1b6f@redhat.com>
 <a01758f98b3f46f282f0d6974862680d@intel.com>
 <f554501a-19d9-a22d-f399-5db4dbb81764@redhat.com>
 <YOSVZLwZzY/rZ0db@t490s>
 <b94e02b7e7bd4f2a8cbed73cb7756a68@intel.com>
MIME-Version: 1.0
In-Reply-To: <b94e02b7e7bd4f2a8cbed73cb7756a68@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
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
Cc: Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 07, 2021 at 12:45:32PM +0000, Wang, Wei W wrote:
> Btw, what would you think if we change mutex to QemuSpin? It will also reduce the overhead, I think.

As I replied at the other place, the bottleneck we encountered is the lock
taking not sleeping, so I'm afraid spinlock will have the same issue. Thanks,

-- 
Peter Xu


