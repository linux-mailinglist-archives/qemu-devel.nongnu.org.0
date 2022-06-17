Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B52654F964
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 16:42:35 +0200 (CEST)
Received: from localhost ([::1]:58460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2DBC-0008HD-7i
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 10:42:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o2DA0-0007c3-TS
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 10:41:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o2D9w-0004H5-RG
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 10:41:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655476875;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=WFvkXqb+rmCqu7rhQyK0Bmj1pQ6SmybCXAGxTEQHYRY=;
 b=XBODoqjJRmqRvB9ZpNkP9ld+CObOjnRW4SUaOCwbY+ZeAwEa1FdOR1h9UxYCrO1dRXCkcI
 nQO9pTOEcwaJuTXMQ5kTBVJ5z/wYs+zQPoY7FmxHCOwLLSmxeAprGZn/5MPEr8injZ8b4A
 2/L6G7jSVPpOUzYlgVBmZ+QhsMUeUIs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-82-JylUeu4GNYy6kUzrrOne3g-1; Fri, 17 Jun 2022 10:41:14 -0400
X-MC-Unique: JylUeu4GNYy6kUzrrOne3g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2758E29AB3FE
 for <qemu-devel@nongnu.org>; Fri, 17 Jun 2022 14:41:14 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.139])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A8081415109;
 Fri, 17 Jun 2022 14:41:12 +0000 (UTC)
Date: Fri, 17 Jun 2022 15:41:10 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Victor Toso <victortoso@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>
Subject: Re: [RFC PATCH v2 3/8] qapi: golang: Generate qapi's struct types in
 Go
Message-ID: <YqySho/9/orXWT7j@redhat.com>
References: <20220617121932.249381-1-victortoso@redhat.com>
 <20220617121932.249381-4-victortoso@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220617121932.249381-4-victortoso@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 17, 2022 at 02:19:27PM +0200, Victor Toso wrote:
> This patch handles QAPI struct types and generates the equivalent
> types in Go.
> 
> At the time of this writing, it generates 388 structures.
> 
> The highlights of this implementation are:
> 
> 1. Generating an Go struct that requires a @base type, the @base type
>    fields are copied over to the Go struct. The advantage of this
>    approach is to not have embed structs in any of the QAPI types.
>    The downside are some generated Types that are likely useless now,
>    like InetSocketAddressBase from InetSocketAddress.
> 
> 2. About the Go struct's fields:
> 
>   i) They can be either by Value or Reference.
> 
>   ii) Every field that is marked as optional in the QAPI specification
>   are translated to Reference fields in its Go structure. This design
>   decision is the most straightforward way to check if a given field
>   was set or not.
> 
>   iii) Mandatory fields are always by Value with the exception of QAPI
>   arrays, which are handled by Reference (to a block of memory) by Go.
> 
>   iv) All the fields are named with Uppercase due Golang's export
>   convention.
> 
>   v) In order to avoid any kind of issues when encoding ordecoding, to
>   or from JSON, we mark all fields with its @name and, when it is
>   optional, member, with @omitempty
> 
> Example:
> 
> qapi:
>   | { 'struct': 'BlockdevCreateOptionsFile',
>   |   'data': { 'filename':             'str',
>   |             'size':                 'size',
>   |             '*preallocation':       'PreallocMode',
>   |             '*nocow':               'bool',
>   |             '*extent-size-hint':    'size'} }
> 
> go:
>   | type BlockdevCreateOptionsFile struct {
>   |         Filename       string        `json:"filename"`
>   |         Size           uint64        `json:"size"`
>   |         Preallocation  *PreallocMode `json:"preallocation,omitempty"`
>   |         Nocow          *bool         `json:"nocow,omitempty"`
>   |         ExtentSizeHint *uint64       `json:"extent-size-hint,omitempty"`
>   | }

One thing to bear in mind here

At the QAPI level, changing a field from mandatory to optional has
been considered a backwards compatible change by QEMU maintainers,
because any existing caller can happily continue passing the
optional field with no downside.

With this Go design, changing a field from mandatory to optional
will be an API breakage, because the developer will need to change
from passing a literal value, to a pointer to the value, when
initializing the struct.

IOW, this Go impl provides weaker compat guarantees than even
QAPI does, and QAPI compat guarantees were already weaker than
I would like as an app developer.

If we want to make ourselves future proof, we would have to make
all struct fields optional from the start, even if they are
mandatory at QAPI level. This would make the code less self-documenting
though, so that's not very appealing either.


If we want to avoid this, we would need the same approach I suggested
wrt support multiple versions of the API concurrently. Namely have
versioned structs, so every time there's a field change of any kind,
we introduce a new struct version.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


