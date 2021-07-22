Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D74223D2B5F
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 19:47:41 +0200 (CEST)
Received: from localhost ([::1]:39734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6cnM-0004CI-Tv
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 13:47:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6cho-00053D-3K
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 13:41:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6chm-0003Kr-JM
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 13:41:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626975713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vSn7894DkneqiAPJVKpB6kDYVLztCL89uKviu3ttYPc=;
 b=iAeAJiu01yrPGGeZdulqaTW35qapwqkZyFQ0S5smoh+85g62bVKPHan+8Qyls4XE8Pth+d
 AqDOO265mqk+jZpYchgpGgIPefhAor6hieqUNf82YiVmr1zYrzJMRW0RbefafwYSj4X1fv
 L//LvJ/kT+b8vczsKWvMUTXHy3Kw5eU=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-AtaYtDDKMxCJkhvE5Tf5Jg-1; Thu, 22 Jul 2021 13:41:52 -0400
X-MC-Unique: AtaYtDDKMxCJkhvE5Tf5Jg-1
Received: by mail-qk1-f200.google.com with SMTP id
 o14-20020a05620a0d4eb02903a5eee61155so4657544qkl.9
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 10:41:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vSn7894DkneqiAPJVKpB6kDYVLztCL89uKviu3ttYPc=;
 b=frlNJqy4dCblhVvFyddiuKxUS2j16osdNll0+7YzAdWrMX+Hko8Fb25EpRhqyOcBnZ
 VoYAO8rtda4ZoXVERpO/nGeQs0r/HMVq8SQkvcVNpAoUV9BsSKLec1igCMqOMICawIm1
 XB/1OLb13YqHGA5nm3hrsuCLK2pOeg3EXUcUBJdMOs288aGWjvaLwAi7trA/nT55gJUO
 2rYFC8LIGA9rrLZey2N7/KGWwQ1Sb7qi12imjbA8hSrUyueVCbRSCqoRya7XebqReJe8
 yCNYngh0bX4EoH1/smCu2iPLneFR2BZmlZ/dqM3TSa9b/AVyJf8PHItS8wFscAaOhk21
 AVgA==
X-Gm-Message-State: AOAM533Rvr8LaAli3TihOWM71AbAEBqtJL+kEs1BhklCC8NN/jnwsYlR
 NVcOpMHMrve0zPlquOgpLZE9x5sKxzwCjPQ5IEyrX3NTKLj/1b4gBYHr3ewuX81ptfN9de1pNAv
 bq6jhG0QgWQIb29s=
X-Received: by 2002:a37:a544:: with SMTP id o65mr833946qke.68.1626975712222;
 Thu, 22 Jul 2021 10:41:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwwMZiyVbCOhv1Uh5ka1IMG66lf/H4X5XdKPkwjVRZ0YO+xuZ4El2vLXyWZS6rUFjp+tqJbuQ==
X-Received: by 2002:a37:a544:: with SMTP id o65mr833929qke.68.1626975712037;
 Thu, 22 Jul 2021 10:41:52 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id k14sm10804319qtm.18.2021.07.22.10.41.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 10:41:51 -0700 (PDT)
Date: Thu, 22 Jul 2021 13:41:50 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3] migration: clear the memory region dirty bitmap when
 skipping free pages
Message-ID: <YPmt3vrn5MfH6I13@t490s>
References: <20210722083055.23352-1-wei.w.wang@intel.com>
 <0faf5f01-399f-621f-431e-d35b3e87b9ff@redhat.com>
 <b39f279ef6634325ab2be8d903e41001@intel.com>
 <YPmF1BAHA059yYln@t490s>
 <ab4a5e1e-ed7f-5b4b-88e6-d4c56ed5a256@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ab4a5e1e-ed7f-5b4b-88e6-d4c56ed5a256@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: "Wang, Wei W" <wei.w.wang@intel.com>, "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 22, 2021 at 04:51:48PM +0200, David Hildenbrand wrote:
> I'll give it a churn.

Thanks, David.

-- 
Peter Xu


