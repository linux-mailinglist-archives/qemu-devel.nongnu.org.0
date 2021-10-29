Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2C143F4C6
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 04:03:48 +0200 (CEST)
Received: from localhost ([::1]:56514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgHFC-0002Ac-Jo
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 22:03:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mgHDr-0000yg-Sy
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 22:02:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mgHDn-0004Bf-9S
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 22:02:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635472937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zoQJPyQw8wx8Q2MI+1ndcLzPV4FbxEZ7ckfcNZVdxlM=;
 b=bGVDn19KYxiHsXWAABut8Kd8MbJRjR9MhvE7q6SpavCRMFc/Lvp5HTYsjo3nZXeCI0QXUJ
 Z9MbLNO+lZfxDWTiKWaJbreBzCoarMl5pCrYrwVLzNDZ3p77G0Bo3FXiWyBx/we7HNugWj
 XthlIWkD+v5/uV22Ji5W5GZzl0DmLHs=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-z7NCuWgNNDG9UT1lpPPEDQ-1; Thu, 28 Oct 2021 22:02:15 -0400
X-MC-Unique: z7NCuWgNNDG9UT1lpPPEDQ-1
Received: by mail-pf1-f197.google.com with SMTP id
 k14-20020aa788ce000000b0047bf198913eso4258379pff.5
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 19:02:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=zoQJPyQw8wx8Q2MI+1ndcLzPV4FbxEZ7ckfcNZVdxlM=;
 b=taXOh01CKov6FRTADKpgtX3mdgK5pOjFsHEQC4XPdCT2o5HH5Ak4uPvIrAikM+TF5E
 X2uvlWIZtEB+uFZX+/Ma1xK4g+fWOqPbf0iwlt+NN2c1n69yq5D7OOoM12AMhczKIykW
 b0VrbkHvbKj9QMncSc3jt1uFY1v0wwk1oqq0JqQnzGIv+pvaUadlr1gUQJvkad2XrbqQ
 sywYg8phQ8OjOr0K+yg109imWKbwVkeYZgNKDTahmT7bWuYhnkoxT1cldYi3jQeBPpSw
 QYWI6JrNrYGVzcoZhKWwHDzjoXa4FhehlwFzKrh4CnpPYXubvP9Ok0bdyQCPWj5EZmX8
 xDfw==
X-Gm-Message-State: AOAM5309kI34aWvuAkC+zbQS64rCL2SneNCUX8iXht9b7EcwZerrKep7
 YVCA6lQf3VsSV2vPaXN0m6m/f4WUaeTMxZAGUYbUDwgTVP4dswDU/ZZTDJs9ZJHTAzDK9qHXxH4
 ncCHYvP31+Gh5hHk=
X-Received: by 2002:a05:6a00:b46:b0:47b:f401:d76a with SMTP id
 p6-20020a056a000b4600b0047bf401d76amr7835986pfo.47.1635472934390; 
 Thu, 28 Oct 2021 19:02:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwa4LTgk0UP78mf57JSRqZ+1ji9mB+SpERy92rBEDCdcePNO2ysEIGNeQelF7n27r5DK1DIqA==
X-Received: by 2002:a05:6a00:b46:b0:47b:f401:d76a with SMTP id
 p6-20020a056a000b4600b0047bf401d76amr7835946pfo.47.1635472934043; 
 Thu, 28 Oct 2021 19:02:14 -0700 (PDT)
Received: from xz-m1.local ([191.101.132.51])
 by smtp.gmail.com with ESMTPSA id y23sm5256502pfa.220.2021.10.28.19.02.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 19:02:13 -0700 (PDT)
Date: Fri, 29 Oct 2021 10:02:06 +0800
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v4 01/22] monitor: remove 'info ioapic' HMP command
Message-ID: <YXtWHgv4w+mzAEgN@xz-m1.local>
References: <20211028155457.967291-1-berrange@redhat.com>
 <20211028155457.967291-2-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211028155457.967291-2-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 David Hildenbrand <david@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 28, 2021 at 04:54:36PM +0100, Daniel P. Berrangé wrote:
> This command was turned into a no-op four years ago in
> 
>   commit 0c8465440d50c18a7bb13d0a866748f0593e193a
>   Author: Peter Xu <peterx@redhat.com>
>   Date:   Fri Dec 29 15:31:04 2017 +0800
> 
>     hmp: obsolete "info ioapic"
> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


