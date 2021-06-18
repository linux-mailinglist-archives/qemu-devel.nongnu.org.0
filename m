Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FDD3AC640
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 10:33:47 +0200 (CEST)
Received: from localhost ([::1]:59098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lu9wg-0005X4-IU
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 04:33:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lu9th-00048y-0G
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 04:30:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lu9te-00042W-5W
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 04:30:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624005037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3RpznjrUFuwhBSa5FLRcI5TtFR2ZKS/QbQirBvJpZio=;
 b=RmCvW17aPm/jnnAfHDnnsek7ebzv4u/J0NSjxqSMK0+s7FGkJk4ySHRzSJ7aAi4XdR7GXa
 gY/3DWL6AhciXBUIecrv9zNwEnO10U8kLETjioFve8cNqUuFObWtUvP95gKxriPV+8SAen
 KsiiDtmB38V1EDevXMPM2pBUwP6GOqE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-Fbi8CRXLMOeF54v8ul6niA-1; Fri, 18 Jun 2021 04:30:36 -0400
X-MC-Unique: Fbi8CRXLMOeF54v8ul6niA-1
Received: by mail-ej1-f70.google.com with SMTP id
 de48-20020a1709069bf0b029048ae3ebecabso30300ejc.16
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 01:30:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=3RpznjrUFuwhBSa5FLRcI5TtFR2ZKS/QbQirBvJpZio=;
 b=k5S5QgqOV/lHVghmyaFE+aceMqhIMTydxcRGuH0shOiIJGzFKUz7BckZkWqyjoN9hT
 OKc9HSsfSsQ0Vs4vQ10qhlSCfXR/9uskHP8ZxM+WSf5cNSfudER5Q40WabNDousK9yvU
 KfLmkAvpyq3lcKtCz/fAGR/BhpRYkNiLrnG2M79UCi3IVDvekZ12+JzmL/wmBZ1sNu7A
 Iq+84svIve05wt/lulf038+9EBy48pAfXVKIvO7rw3pBc3uouQofsggR4SrFJN7oL75E
 DzKmRHizC7E+qJ6er/lZK1ICL/bBA6fnJaQCZM2X3mMWdYtv07REG2FJE8bi4VqSuZLR
 0PpQ==
X-Gm-Message-State: AOAM53043W/+lAAaZm0fJqih8WqiGdo7mw8BY15MzmFNeqRPL2eX55H7
 iaibDFDAhMridZUJe2waV8577Ld0Pp4u5QrYnV4Fipt/DjuCnC1oxo9qTaWJuOlclwWXUQnxOjV
 1c+sxSS8Dzf+8fpQ=
X-Received: by 2002:a17:906:3ed0:: with SMTP id
 d16mr9640339ejj.16.1624005034850; 
 Fri, 18 Jun 2021 01:30:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOL5brcmw/PPN5eMjtu0oSiiqnTQUB4AFjV3L+nyzVnGKgPJ6X1SefNFnrI2ySa1azHywLBw==
X-Received: by 2002:a17:906:3ed0:: with SMTP id
 d16mr9640332ejj.16.1624005034689; 
 Fri, 18 Jun 2021 01:30:34 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 t15sm733977ejf.119.2021.06.18.01.30.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 01:30:34 -0700 (PDT)
Subject: Re: [PATCH v2 7/9] virtiofsd: Add inodes_by_handle hash table
To: qemu-devel@nongnu.org, virtio-fs@redhat.com
References: <20210609155551.44437-1-mreitz@redhat.com>
 <20210609155551.44437-8-mreitz@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <d5bf57eb-5ede-1951-29f9-2d40390dbbf7@redhat.com>
Date: Fri, 18 Jun 2021 10:30:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210609155551.44437-8-mreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.254, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09.06.21 17:55, Max Reitz wrote:
> Currently, lo_inode.fhandle is always NULL and so always keep an O_PATH
> FD in lo_inode.fd.  Therefore, when the respective inode is unlinked,
> its inode ID will remain in use until we drop our lo_inode (and
> lo_inode_put() thus closes the FD).  Therefore, lo_find() can safely use
> the inode ID as an lo_inode key, because any inode with an inode ID we
> find in lo_data.inodes (on the same filesystem) must be the exact same
> file.
>
> This will change when we start setting lo_inode.fhandle so we do not
> have to keep an O_PATH FD open.  Then, unlinking such an inode will
> immediately remove it, so its ID can then be reused by newly created
> files, even while the lo_inode object is still there[1].
>
> So creating a new file can then reuse the old file's inode ID, and
> looking up the new file would lead to us finding the old file's
> lo_inode, which is not ideal.
>
> Luckily, just as file handles cause this problem, they also solve it:  A
> file handle contains a generation ID, which changes when an inode ID is
> reused, so the new file can be distinguished from the old one.  So all
> we need to do is to add a second map besides lo_data.inodes that maps
> file handles to lo_inodes, namely lo_data.inodes_by_handle.  For
> clarity, lo_data.inodes is renamed to lo_data.inodes_by_ids.
>
> Unfortunately, we cannot rely on being able to generate file handles
> every time.  Therefore, we still enter every lo_inode object into
> inodes_by_ids, but having an entry in inodes_by_handle is optional.  A
> potential inodes_by_handle entry then has precedence, the inodes_by_ids
> entry is just a fallback.
>
> Note that we do not generate lo_fhandle objects yet, and so we also do
> not enter anything into the inodes_by_handle map yet.  Also, all lookups
> skip that map.  We might manually create file handles with some code
> that is immediately removed by the next patch again, but that would
> break the assumption in lo_find() that every lo_inode with a non-NULL
> .fhandle must have an entry in inodes_by_handle and vice versa.  So we
> leave actually using the inodes_by_handle map for the next patch.
>
> [1] If some application in the guest still has the file open, there is
> going to be a corresponding FD mapping in lo_data.fd_map.  In such a
> case, the inode will only go away once every application in the guest
> has closed it.  The problem described only applies to cases where the
> guest does not have the file open, and it is just in the dentry cache,
> basically.
>
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
> ---
>   tools/virtiofsd/passthrough_ll.c | 80 +++++++++++++++++++++++++-------
>   1 file changed, 64 insertions(+), 16 deletions(-)

[...]

> @@ -3931,10 +3954,34 @@ static gboolean lo_key_equal(gconstpointer a, gconstpointer b)
>       return la->ino == lb->ino && la->dev == lb->dev && la->mnt_id == lb->mnt_id;
>   }
>   
> +static guint lo_fhandle_hash(gconstpointer key)
> +{
> +    const struct lo_fhandle *fh = key;
> +    guint hash;
> +    size_t i;
> +
> +    /* Basically g_str_hash() */
> +    hash = 5381;
> +    for (i = 0; i < sizeof(fh->padding); i++) {
> +        hash += hash * 33 + (unsigned char)fh->padding[i];
> +    }
> +    hash += hash * 33 + fh->mount_id;

Just spotted: These `+=` should be `=`.

Max

> +
> +    return hash;
> +}


