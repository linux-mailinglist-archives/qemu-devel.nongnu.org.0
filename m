Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0836D6582
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 16:36:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjhm7-0008Dc-Jj; Tue, 04 Apr 2023 10:36:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pjhm1-00083Z-VA
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:36:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pjhm0-0005h8-GF
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:36:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680618995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fhjhMDhQYIeXERXuoopies7nqzbWbf4DkPso/nVfrOY=;
 b=DWOcEuls9OLsD9ZvdmS6QFNDbNUAyvRcWJXvdj5QHBA8CwauA/z6nQcVIIRmFlCQmKToBD
 sSx2j+nYRokTRVScdfOWPMvxnYOzlMhgux4oqJTZVa3isz8TIyiL1teaMo+jUjOc7gb1h4
 6rdyI5/O2Wb/jlpvmQsmrjg+GmQVxCg=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-354-VXe-MaQeOGmL8SdEKWpKlQ-1; Tue, 04 Apr 2023 10:36:34 -0400
X-MC-Unique: VXe-MaQeOGmL8SdEKWpKlQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 v5-20020a379305000000b0074a37810157so3220655qkd.21
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 07:36:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680618993; x=1683210993;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fhjhMDhQYIeXERXuoopies7nqzbWbf4DkPso/nVfrOY=;
 b=CpZQnYEQIk+ipq0Nhc6vB+aa9RZ58vndprgbL8v83UhLH1bwMrnekNBfCE8zCYlnrl
 MGbVRIcD1Lg/hug9ju/Q0Gxd3YKYXxzl86UvnNyFMOb2NI48JQo5urxkak36XYDcm+zg
 78WMc7lDBb92Euhxpi+vXFXWuFvf7Wb6BYrXM+bYA2LnH5OxCJZiijbFFLzUlk54k7GU
 xeFSQMKIXuKFj994PN1wj4kbKAQQUfspboBT0HSUVYGMJCEa5vfVv6RxJsCXpvk0szVL
 isSxY935VnvRVmQi4PfDzeAzWIzHkv4fkzZu1B+Y+ohPKlgikaWOA205kmp6T9o4rW4w
 8xXg==
X-Gm-Message-State: AAQBX9cTgD41oI5dWf2w4nf869sIFxyj5Mq12pTTc5y6EUD7DzbgKint
 +GcYZLwcmWLKo4nGnb2W/cPvQriG7zAX7rzfXE/xS6dBNHaxkqeJr31f4blThTetdUrXmYXGFLd
 fCECiYMlEXdsfSok=
X-Received: by 2002:a05:6214:400e:b0:56e:f7dd:47ad with SMTP id
 kd14-20020a056214400e00b0056ef7dd47admr3578498qvb.5.1680618993612; 
 Tue, 04 Apr 2023 07:36:33 -0700 (PDT)
X-Google-Smtp-Source: AKy350aw4gHY3dmoCGhj3YnWHsQGVR3NXGkI5IK3nL+Djr/rIg3jNK8Y8NNx1NSKbmwDLgl+h0Cn4A==
X-Received: by 2002:a05:6214:400e:b0:56e:f7dd:47ad with SMTP id
 kd14-20020a056214400e00b0056ef7dd47admr3578472qvb.5.1680618993325; 
 Tue, 04 Apr 2023 07:36:33 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 nd13-20020a056214420d00b005dd8b9345absm3392896qvb.67.2023.04.04.07.36.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 07:36:32 -0700 (PDT)
Date: Tue, 4 Apr 2023 10:36:25 -0400
From: Peter Xu <peterx@redhat.com>
To: Alexander Graf <graf@amazon.com>
Cc: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, Philippe Mathieu-Daude <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>
Subject: Re: [PATCH v5] hostmem-file: add offset option
Message-ID: <ZCw16TyJf1iOS/1T@x1n>
References: <20230403221421.60877-1-graf@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230403221421.60877-1-graf@amazon.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Apr 03, 2023 at 10:14:21PM +0000, Alexander Graf wrote:
> Add an option for hostmem-file to start the memory object at an offset
> into the target file. This is useful if multiple memory objects reside
> inside the same target file, such as a device node.
> 
> In particular, it's useful to map guest memory directly into /dev/mem
> for experimentation.
> 
> To make this work consistently, also fix up all places in QEMU that
> expect fd offsets to be 0.
> 
> Signed-off-by: Alexander Graf <graf@amazon.com>

Acked-by: Peter Xu <peterx@redhat.com>

I also agree it'll be nicer to split the fix into separate patch, though.
The only affected part IIUC is multi-process QEMU since 6.0.0.  Copying the
maintainers too so they'll be aware.

Corresponds to the tag:

Fixes: ed5d001916 ("multi-process: setup memory manager for remote device")

-- 
Peter Xu


