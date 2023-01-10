Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D4B664CFC
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 21:05:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFKrB-0007xT-3n; Tue, 10 Jan 2023 15:04:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pFKr1-0007ws-9Q
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 15:04:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pFKqz-0007Mp-Jk
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 15:04:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673381051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zJcZk9dRPge+pLelKunDSg/B1HV6SFFfYG1jbWWPv9o=;
 b=Suwjuq0ScCQkpoYVZYPYiKIBqZcn8U4+h7V/y/G1tlkJXYUqg+ts9DfAb219iXXWlikjfy
 bSYljqpC+uYwzhwp/Du4BdfSaeNQAsyb8eM1P6mjQ4cghvXiN5JqpFvYlCDlUssXX1GlI7
 CiIw3UATNrEwH8C/atZMo1fp3MG+9Bg=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-594-OwmHOw6kNLqY8IunsqcqJA-1; Tue, 10 Jan 2023 15:04:04 -0500
X-MC-Unique: OwmHOw6kNLqY8IunsqcqJA-1
Received: by mail-oi1-f200.google.com with SMTP id
 bp6-20020a056808238600b00360c55456bcso3852445oib.2
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 12:04:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zJcZk9dRPge+pLelKunDSg/B1HV6SFFfYG1jbWWPv9o=;
 b=4K0Mip5n7mEG2+UCnXgPBqErkYbAyhPzF21/0GsOgvkEAmFIvOD2N/BWojelK4juY8
 mc4ffwTmVDy9mOamX/F5QgBnuP+yQb8A4/zUr7TVQEZZACslrKC2DlR5bFcUFtILMsS4
 xKwLWs2QpQ9+rBkeW2sKeWdzQEIO4GDUwZH7Gw2G8Xapk//g/ef8FtPMRnPK58B1kp+0
 gr5EmLtpO4Rg+98Jph3JT2hcIc+XLa3B4rl1qeP5qM8Ta5pgxqwa2wMp2+UIGD3GzcwN
 5BIgGHBKg4ezEdPXI/CiC411kZ9KaGGMjzE9Rk7ePpws3pdb5oBlWI2rNnrGuQGOho4A
 pPzQ==
X-Gm-Message-State: AFqh2kq8PldyYggnQ+onAEHSqICLuCcqIygXAMsf1eqcmpRImkEVw4iO
 0tpU9bYV3/+1BkOaJ33eRqBTwxzCXd9WnZgNTdEPhvubZWxq+9JnoYu0xSJFgi4YkE/l8QF04HB
 1jljE5GwqhzLpITA=
X-Received: by 2002:a05:6871:470c:b0:148:1f81:d14c with SMTP id
 py12-20020a056871470c00b001481f81d14cmr29288507oab.14.1673381041952; 
 Tue, 10 Jan 2023 12:04:01 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvj6ZYE0chrzL/btS+x5ZfnPGuQZoyGeO/wZe+8uK4fh2fnS7EX8+1/eyZC31P7qLQzKp8Rvg==
X-Received: by 2002:a05:6871:470c:b0:148:1f81:d14c with SMTP id
 py12-20020a056871470c00b001481f81d14cmr29288488oab.14.1673381041642; 
 Tue, 10 Jan 2023 12:04:01 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 f8-20020a05620a408800b0070543181468sm7754425qko.57.2023.01.10.12.04.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 12:04:00 -0800 (PST)
Date: Tue, 10 Jan 2023 15:03:59 -0500
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
Subject: Re: [PATCH v3 1/6] migration: Allow immutable device state to be
 migrated early (i.e., before RAM)
Message-ID: <Y73Er/n86CgQTMYu@x1n>
References: <20221222110215.130392-1-david@redhat.com>
 <20221222110215.130392-2-david@redhat.com> <Y7W2LtO5/m1r3VaL@x1n>
 <d60f9272-1e81-00da-8046-2264a9b97e58@redhat.com>
 <Y7cFplyGc4hIrYZW@x1n>
 <482fadb5-7420-e07b-982d-5b0f3e8c42f8@redhat.com>
 <Y7xw4RqLQUFWZyfI@x1n>
 <460b6ea0-67a6-891f-f8fb-a5f23e9985c4@redhat.com>
 <c6a66296-94a7-e1ef-e0c1-098071f961d2@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c6a66296-94a7-e1ef-e0c1-098071f961d2@redhat.com>
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

On Tue, Jan 10, 2023 at 12:52:32PM +0100, David Hildenbrand wrote:
> The following seems to work,

That looks much better at least from the diffstat pov (comparing to the
existing patch 1+5 and the framework changes), thanks.

> but makes analyze-migration.py angry:
> 
> $ ./scripts/analyze-migration.py -f STATEFILE
> Traceback (most recent call last):
>   File "/home/dhildenb/git/qemu/./scripts/analyze-migration.py", line 605, in <module>
>     dump.read(dump_memory = args.memory)
>   File "/home/dhildenb/git/qemu/./scripts/analyze-migration.py", line 539, in read
>     classdesc = self.section_classes[section_key]
>                 ~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^
> KeyError: ('0000:00:03.0/virtio-mem-early', 0)
> 
> 
> We need the vmdesc to create info for the device.

Migration may ignore the save entry if save_state() not provided in the
"devices" section:

        if ((!se->ops || !se->ops->save_state) && !se->vmsd) {
            continue;
        }

Could you try providing a shim save_state() for the new virtio-mem save
entry?

/*
 * Shim function to make sure the save entry will be dumped into "devices"
 * section, to make analyze-migration.py happy.
 */
static void virtio_mem_save_state_early(QEMUFile *file, void *opaque)
{
}

Then:

static const SaveVMHandlers vmstate_virtio_mem_device_early_ops = {
    .save_setup = virtio_mem_save_setup_early,
    .save_state = virtio_mem_save_state_early,
    .load_state = virtio_mem_load_state_early,
};

I'm not 100% sure it'll work yet, but maybe worth trying.

Thanks,

-- 
Peter Xu


