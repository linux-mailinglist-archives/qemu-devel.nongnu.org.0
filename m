Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF726AA4AE
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 23:41:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYE55-0007il-4H; Fri, 03 Mar 2023 17:40:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pYE53-0007ce-0f
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 17:40:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pYE51-0003ML-El
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 17:40:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677883246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YCs++0UsDn2I23tW4LFZnn2rnwrR0f+f/KvujfQTnE8=;
 b=Y6tU5Z0OpxPexp/hLVu1+yGyZybAtrsdouvucUMVyxTTtD0OrpkrNSm3fyZuct1GGU6sck
 CrNMwPERH6vQkVPQin1kLqC4JXUZpJCZRreEdN8EY3mmJ1CjSupfNkPaYgbLAfWEYwrhHu
 uim0UeIo9D0kn5GkbUf8v5qT/X/DI2M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-235-r9371hxYPgWLxpaUffrfkw-1; Fri, 03 Mar 2023 17:40:41 -0500
X-MC-Unique: r9371hxYPgWLxpaUffrfkw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A89D85A5A3;
 Fri,  3 Mar 2023 22:40:41 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B32F492C3E;
 Fri,  3 Mar 2023 22:40:40 +0000 (UTC)
Date: Fri, 3 Mar 2023 16:40:38 -0600
From: Eric Blake <eblake@redhat.com>
To: Wouter Verhelst <w@uter.be>
Cc: nbd@other.debian.org, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 libguestfs@redhat.com
Subject: Re: [PATCH v2 5/6] spec: Introduce NBD_FLAG_BLOCK_STATUS_PAYLOAD
Message-ID: <20230303224038.sxhd6enenp4v7gpa@redhat.com>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
 <20221114224655.2186173-1-eblake@redhat.com>
 <20221114224655.2186173-6-eblake@redhat.com>
 <Y/Xo+DGAYSZ4bQvK@pc220518.home.grep.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y/Xo+DGAYSZ4bQvK@pc220518.home.grep.be>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, Feb 22, 2023 at 12:05:44PM +0200, Wouter Verhelst wrote:
> On Mon, Nov 14, 2022 at 04:46:54PM -0600, Eric Blake wrote:
> >  #### Simple reply message
> > 
> > @@ -1232,6 +1235,19 @@ The field has the following format:
> >    will be faster than a regular write). Clients MUST NOT set the
> >    `NBD_CMD_FLAG_FAST_ZERO` request flag unless this transmission flag
> >    is set.
> > +- bit 12, `NBD_FLAG_BLOCK_STATUS_PAYLOAD`: Indicates that the server
> > +  understands the use of the `NBD_CMD_FLAG_PAYLOAD_LEN` flag to
> > +  `NBD_CMD_BLOCK_STATUS` to allow the client to request that the
> > +  server filters its response to a specific subset of negotiated
> > +  metacontext ids passed in via a client payload, rather than the
> > +  default of replying to all metacontext ids. Servers MUST NOT
> > +  advertise this bit unless the client successfully negotiates
> > +  extended headers via `NBD_OPT_EXTENDED_HEADERS`, and SHOULD NOT
> > +  advertise this bit in response to `NBD_OPT_EXPORT_NAME` or
> > +  `NBD_OPT_GO` if the client does not negotiate metacontexts with
> > +  `NBD_OPT_SET_META_CONTEXT`; clients SHOULD NOT set the
> > +  `NBD_CMD_FLAG_PAYLOAD_LEN` flag for `NBD_CMD_BLOCK_STATUS` unless
> > +  this transmission flag is set.
> 
> Given that we are introducing this at the same time as the extended
> headers (and given that we're running out of available flags in this
> 16-bit field), isn't it better to make the ability to understand
> PAYLOAD_LEN be implied by extended headers? Or is there a use case for
> implementing extended headers but not a payload length on
> CMD_BLOCK_STATUS that I'm missing?

In my proof of implementation, this was a distinct feature addition on
top of 64-bit headers.

It is easy to write a server that does not want to deal with a client
payload on a block status request (for example, a server that only
knows about one metacontext, and therefore never needs to deal with a
client wanting a subset of negotiated metacontexts).  Forcing a server
to have to support a client-side filtering request on block status
commands, merely because the server now supports 64-bit lengths,
seemed like a stretch too far, which is why I decided to use a feature
bit for this one.


-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


