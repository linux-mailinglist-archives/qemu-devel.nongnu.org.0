Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E5A6DDE5A
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 16:44:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmFEQ-0004UK-KN; Tue, 11 Apr 2023 10:44:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pmFEO-0004U5-UE
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 10:44:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pmFEM-0005Av-7G
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 10:44:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681224261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YcMknnPSJsRpRrcE1g55IdAmFHe08hvC3sGEL9z+77w=;
 b=I+8OFd2vPjiK3lr8GgR8B2XP3CLlKEc7pGC1fYulQfQUKLRIrBJs+W1GwavxOftQ/0SCmg
 7e9OnMyaz98b5i0qKwNnVtVe1nEvSGwfujcGv5wg9MUxBHW7LLCtwhYskfNyn0wxh7+80y
 KEUzbBZ9ahb58PnChLcc1j2/O4i5xwg=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-hggCclgNMti-uPB_5nmjyQ-1; Tue, 11 Apr 2023 10:44:19 -0400
X-MC-Unique: hggCclgNMti-uPB_5nmjyQ-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-5e8ebec3e31so3868716d6.0
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 07:44:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681224259; x=1683816259;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YcMknnPSJsRpRrcE1g55IdAmFHe08hvC3sGEL9z+77w=;
 b=vvx/aTBIACkyggce1uQNC0WS5bXsrdiEtvjOhioityhvS6X3efxnNEmHmx28jCwBSS
 i2gPPZrUzfTs738kr7mcsJfpVyX+v+K9/vvfTwXufR2YSuNcfM5k3owHSwItfv2RzKfQ
 pF33KngeSJ3tewVQYGhgvwuAauvWyd6VSlZsgSGwJm/+xAjpRmv+J6W/KWlMJkLVw/jg
 Tk4l2/iUdmr0wvlioCQOuAX3TavLpQqt6TkLJPfWiMRsJRJ2MMa/cZxzif5LRWhX8vI4
 ITO1I0a1Q5raWupycjf54LjbnBOF0n40JHfV+YE2+L2LfWhEDPeSA1XpbfArRmj1k1AT
 fjeQ==
X-Gm-Message-State: AAQBX9cdwbsFDHyqo8hxTgnjV1a7CpcTLufclxE8S43VqlN1sjb3Lrx9
 qyX1/F9/T10QZ4nE5aKW7maZjj92qGXBhHqhxAuPRk8Pgod3VHtf0Y8oKTfZjLSNMhWTEIQ4KmV
 +7SNg9gmwIezcMTY=
X-Received: by 2002:a05:6214:519d:b0:5ac:463b:a992 with SMTP id
 kl29-20020a056214519d00b005ac463ba992mr18804103qvb.0.1681224259057; 
 Tue, 11 Apr 2023 07:44:19 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZyFf3RsELHXWkAaJArGia5wMQecsytosAAHrev7aYgjPs3aVlawF6Ru/3QcG0+4WjrcK8Dgw==
X-Received: by 2002:a05:6214:519d:b0:5ac:463b:a992 with SMTP id
 kl29-20020a056214519d00b005ac463ba992mr18804073qvb.0.1681224258709; 
 Tue, 11 Apr 2023 07:44:18 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 u5-20020a0cee85000000b005dd8b9345bdsm4189510qvr.85.2023.04.11.07.44.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 07:44:18 -0700 (PDT)
Date: Tue, 11 Apr 2023 10:44:17 -0400
From: Peter Xu <peterx@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>, mst@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH for 8.1] intel_iommu: refine iotlb hash calculation
Message-ID: <ZDVyQaEiDyEXNiOH@x1n>
References: <20230410033208.54663-1-jasowang@redhat.com> <ZDVrSVW0FoEuq6+2@x1n>
 <CAFEAcA9jbuR72u=o6tUvpiA+SYFiASnoYRocKWVurscvdUJJAg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA9jbuR72u=o6tUvpiA+SYFiASnoYRocKWVurscvdUJJAg@mail.gmail.com>
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

On Tue, Apr 11, 2023 at 03:30:08PM +0100, Peter Maydell wrote:
> On Tue, 11 Apr 2023 at 15:14, Peter Xu <peterx@redhat.com> wrote:
> >
> > On Mon, Apr 10, 2023 at 11:32:08AM +0800, Jason Wang wrote:
> > > @@ -222,9 +222,9 @@ static guint vtd_iotlb_hash(gconstpointer v)
> > >  {
> > >      const struct vtd_iotlb_key *key = v;
> > >
> > > -    return key->gfn | ((key->sid) << VTD_IOTLB_SID_SHIFT) |
> > > -           (key->level) << VTD_IOTLB_LVL_SHIFT |
> > > -           (key->pasid) << VTD_IOTLB_PASID_SHIFT;
> > > +    return key->gfn | ((uint64_t)(key->sid) << VTD_IOTLB_SID_SHIFT) |
> > > +        (uint64_t)(key->level - 1) << VTD_IOTLB_LVL_SHIFT |
> > > +        (uint64_t)(key->pasid) << VTD_IOTLB_PASID_SHIFT;
> > >  }
> 
> > >  /* The shift of source_id in the key of IOTLB hash table */
> > > -#define VTD_IOTLB_SID_SHIFT         20
> > > -#define VTD_IOTLB_LVL_SHIFT         28
> > > -#define VTD_IOTLB_PASID_SHIFT       30
> > > +#define VTD_IOTLB_SID_SHIFT         26
> > > +#define VTD_IOTLB_LVL_SHIFT         42
> > > +#define VTD_IOTLB_PASID_SHIFT       44
> >
> > This is for the hash function only, IIUC it means anything over
> > sizeof(guint) will be ignored and not contributing anything to the hash
> > value being generated due to the uint64->guint conversion.
> >
> > IOW, I think "level" and "pasid" will just be ignored.
> 
> Whoops, hadn't noticed that guint type... (glib's
> g_int64_hash()'s approach to this is to XOR the top
> 32 bits with the bottom 32 bits to produce the 32-bit
> hash value.)
> 
> Also, does anybody know what the requirements are on
> consistency between the hash_func and the key_equal_func
> for a GHashTable ? Is the hash_func supposed to return the
> same hash for every key that compares equal under key_equal_func ?

I quickly checked up a local (but old) glib code (v2.71.0), and it seems
this is the major place where key_equal_func() is used (also see the
comment above the comparison):

g_hash_table_lookup_node()
{
...
      /* We first check if our full hash values
       * are equal so we can avoid calling the full-blown
       * key equality function in most cases.
       */
      if (node_hash == hash_value)
        {
          gpointer node_key = g_hash_table_fetch_key_or_value (hash_table->keys, node_index, hash_table->have_big_keys);

          if (hash_table->key_equal_func)
            {
              if (hash_table->key_equal_func (node_key, key))
                return node_index;
            }
          else if (node_key == key)
            {
              return node_index;
            }
        }
...
}

I would guess hash_func() is only the fast version but if key_equal_func()
is provided it'll be the final / most accurate way to tell whether two
nodes are the same.

I assume from that POV the hash function should return the same value if
key_equal_func() tells they're the same node.

Thanks,

-- 
Peter Xu


