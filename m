Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 747AF6DD9FD
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 13:46:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmCS8-0005DR-Oe; Tue, 11 Apr 2023 07:46:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pmCS0-0005Cx-47
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 07:46:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pmCRu-0007He-Rv
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 07:46:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681213568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CfgmQEa6mGbDLyJmgM5qbBxvZbEciBZLmcHrVIxFNx4=;
 b=E9BObFYR1nbDpoF4GWWSkvhO5A4O8mxGmOOje0NXvW7S3vukic3nu6nFQHYcJr9ORblWAm
 1j3dzS27IXdk9TMavkRXfNqAnLbGI/WRV9xTKyo3gfJnF+B+ZtJd1uccyP4jGEop51/ZRG
 utsFAxGjpJtS6kC5a9d2BzFLz8tdlks=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-116-YsQ8U7ivOOiy7qx0TjOsgg-1; Tue, 11 Apr 2023 07:46:07 -0400
X-MC-Unique: YsQ8U7ivOOiy7qx0TjOsgg-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-50489dce38aso1088697a12.2
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 04:46:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681213566;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CfgmQEa6mGbDLyJmgM5qbBxvZbEciBZLmcHrVIxFNx4=;
 b=tcVudPedKM4DsmsMwjDZB7+xjlKSqvO5lT3vtdqbNe+VdYowDfKNUfNAnsN2Hw+S3a
 uF+0iWOT6kooHWKTSrRvmmXxHvbviZ/IXQS+NNNCOSeplxroA3LVQTj0B+um81mlSdl9
 NwZWT433y2vK59RqxI4lB8mcTst5bRJVzXWwKDFjJeUU2h/q07ZtU9YQRl/sLHqYQpuH
 JmbHY9avVAln69fU7jTakLLY4FwRuuR6R+qPkBZyEN7SZCG7ctzNYqhM+hJmODYPJd8Q
 cJ0IR2p9urv1wk6H6PExoptxAPuAgGkPx25LoIZU4tSxQ7VLbT09zFbxT4QhynITXN0O
 SPHg==
X-Gm-Message-State: AAQBX9dr0o4EXjNiVEiaqm6s9UIT0TFnbhCXnzuhbA848FBMNCYktzD0
 B8H+/Gd0hFu14Cxy2wfGJFAjmCaOFajwv6IIlAe6OTANM8Ob78AXIqVdi2Vrc3xV0j/obSV8Gx/
 GeHNDS50X28MHNZY=
X-Received: by 2002:a05:6402:142:b0:4fd:29e4:ccfe with SMTP id
 s2-20020a056402014200b004fd29e4ccfemr11017700edu.18.1681213566502; 
 Tue, 11 Apr 2023 04:46:06 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z6zwqttSKp/Xlc6BM8M6wopElUkhdTUqyydMahOpkNF8xZeB0aIjBzphXZeQzLZ1zccOkATA==
X-Received: by 2002:a05:6402:142:b0:4fd:29e4:ccfe with SMTP id
 s2-20020a056402014200b004fd29e4ccfemr11017675edu.18.1681213566159; 
 Tue, 11 Apr 2023 04:46:06 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 f1-20020a50a6c1000000b00504a3ff5c36sm1829244edc.96.2023.04.11.04.46.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 04:46:05 -0700 (PDT)
Date: Tue, 11 Apr 2023 13:46:04 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: Peter Xu <peterx@redhat.com>, Alexander Graf <graf@amazon.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>, Eduardo
 Habkost <eduardo@habkost.net>, "Daniel P . Berrange" <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, Philippe Mathieu-Daude <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Ashish Kalra <ashish.kalra@amd.com>, Tom Lendacky
 <thomas.lendacky@amd.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, John G Johnson
 <john.g.johnson@oracle.com>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v5] hostmem-file: add offset option
Message-ID: <20230411134604.7a617bd7@imammedo.users.ipa.redhat.com>
In-Reply-To: <9930c066-44bf-9365-9c68-aa5ff505c9ba@redhat.com>
References: <20230403221421.60877-1-graf@amazon.com> <ZCw16TyJf1iOS/1T@x1n>
 <9930c066-44bf-9365-9c68-aa5ff505c9ba@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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

On Wed, 5 Apr 2023 15:58:31 +0200
David Hildenbrand <david@redhat.com> wrote:

> On 04.04.23 16:36, Peter Xu wrote:
> > On Mon, Apr 03, 2023 at 10:14:21PM +0000, Alexander Graf wrote:  
> >> Add an option for hostmem-file to start the memory object at an offset
> >> into the target file. This is useful if multiple memory objects reside
> >> inside the same target file, such as a device node.
> >>
> >> In particular, it's useful to map guest memory directly into /dev/mem
> >> for experimentation.
> >>
> >> To make this work consistently, also fix up all places in QEMU that
> >> expect fd offsets to be 0.
> >>
> >> Signed-off-by: Alexander Graf <graf@amazon.com>  
> > 
> > Acked-by: Peter Xu <peterx@redhat.com>
> > 
> > I also agree it'll be nicer to split the fix into separate patch, though.
> > The only affected part IIUC is multi-process QEMU since 6.0.0.  Copying the
> > maintainers too so they'll be aware.
> > 
> > Corresponds to the tag:
> > 
> > Fixes: ed5d001916 ("multi-process: setup memory manager for remote device")
> >   
> 
> If there are no options on splitting out the fix, I'll route this via my 
> tree.

Having fixes as separate prep patch is much more preferable.

Another question is if we should also check that provided
offset honors 'align' option?


