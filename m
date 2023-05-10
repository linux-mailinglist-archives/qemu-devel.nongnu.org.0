Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3185F6FD9AC
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 10:40:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwfMu-0005xe-Qm; Wed, 10 May 2023 04:40:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwfMs-0005xK-MU
 for qemu-devel@nongnu.org; Wed, 10 May 2023 04:40:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwfMq-00029w-GV
 for qemu-devel@nongnu.org; Wed, 10 May 2023 04:40:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683708011;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=QcOgEeV5/0D6sOL8hrZwbGHVBr265ntnNsI0iDIkIBQ=;
 b=JHgNrThSl/gpcbVwbhYsYH1d5hGlKf3Nt6w3vxmhCK2qwC09UYaVViSu5eoLuU6MsyTUBz
 aYA6akyjFjX+buX7/N7G7DNNq3ySizUmXzPLe427mwJXZ9HNaqK+rDaGkta4vFDPSbUHQt
 2S7BkMjdHI1nuX2rl574nuGNqz6F1yY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-504-6acaaZ_GN2iCf2ewpdptDw-1; Wed, 10 May 2023 04:40:09 -0400
X-MC-Unique: 6acaaZ_GN2iCf2ewpdptDw-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f422dc5ee5so20145025e9.0
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 01:40:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683708008; x=1686300008;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QcOgEeV5/0D6sOL8hrZwbGHVBr265ntnNsI0iDIkIBQ=;
 b=Bj3f3auL7GK4c/fKK6U10kgTA7rciGbu0ffzQnimy2yXiTgoPghWm9BbBz9KsRqi62
 DLw8X/72czE/b1aTCbeBMgb0hKwQoxI3GrUKZPKkFs/dnC/KTenvnC0qBp94kzDvnuHW
 wKSp3JBuRSkkBpGwoexgDEJghaDtVJ3Dq8NOLxP+ym9ctJb7Rxy3vOsKRLAXu5lvRodP
 8JSZF06iqty0yirl+Jr4wzaXoU0R5hXNSnLCrACbrmlnM5/Gvcy8p2IPnXhN9qBzHIlM
 1OOPmXS+IFdgOKoLDRFvZZyr+/hYhp/QrQopIXd2VdYM6i19T1+k6FggrT60OplSF6IP
 y0nw==
X-Gm-Message-State: AC+VfDypHe6XqyPkeiO+bd4PGMaccUB1C6MpCOhgM7Q2mVza6Oj/mSXI
 E6I9438H2UeKbOcErGBPcxcHuiAN8MbPuHYJ73Nsm6WzEU0vA0O25+llUZrKPFLGQdPyDH0PTJ1
 5JX8Qw2JXqb9f2RI=
X-Received: by 2002:a05:600c:ad8:b0:3f0:a06a:7593 with SMTP id
 c24-20020a05600c0ad800b003f0a06a7593mr12115488wmr.11.1683708008669; 
 Wed, 10 May 2023 01:40:08 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5TAUpUT6gAKGVJgbvU4o88opI3mo1ibVQrrxzjiXsHFkT9+T9QL3nV08GTTKM0+bnPMPtmgA==
X-Received: by 2002:a05:600c:ad8:b0:3f0:a06a:7593 with SMTP id
 c24-20020a05600c0ad800b003f0a06a7593mr12115469wmr.11.1683708008340; 
 Wed, 10 May 2023 01:40:08 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 o10-20020a1c750a000000b003f42bb3a5adsm4228307wmc.4.2023.05.10.01.40.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 01:40:07 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Avihai Horon <avihaih@nvidia.com>
Cc: <qemu-devel@nongnu.org>,  Alex Williamson <alex.williamson@redhat.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>,  Peter Xu
 <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>,  Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,  Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Yishai Hadas <yishaih@nvidia.com>,  Jason
 Gunthorpe <jgg@nvidia.com>,  Maor Gottlieb <maorg@nvidia.com>,  Kirti
 Wankhede <kwankhede@nvidia.com>,  Tarun Gupta <targupta@nvidia.com>,  Joao
 Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH 2/8] migration: Add precopy initial data handshake
In-Reply-To: <20230501140141.11743-3-avihaih@nvidia.com> (Avihai Horon's
 message of "Mon, 1 May 2023 17:01:35 +0300")
References: <20230501140141.11743-1-avihaih@nvidia.com>
 <20230501140141.11743-3-avihaih@nvidia.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 10 May 2023 10:40:06 +0200
Message-ID: <87h6ska8bd.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Avihai Horon <avihaih@nvidia.com> wrote:
> Add precopy initial data handshake between source and destination upon
> migration setup. The purpose of the handshake is to notify the
> destination that precopy initial data is used and which migration users
> (i.e., SaveStateEntry) are going to use it.
>
> The handshake is done in two levels. First, a general enable command is
> sent to notify the destination migration code that precopy initial data
> is used.
> Then, for each migration user in the source that supports precopy
> initial data, an enable command is sent to its counterpart in the
> destination:
> If both support it, precopy initial data will be used for them.
> If source doesn't support it, precopy initial data will not be used for
> them.
> If source supports it and destination doesn't, migration will be failed.
>
> To implement it, a new migration command MIG_CMD_INITIAL_DATA_ENABLE is
> added, as well as a new SaveVMHandlers handler initial_data_advise.
> Calling the handler advises the migration user that precopy initial data
> is used and its return value indicates whether precopy initial data is
> supported by it.
>
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>

> diff --git a/migration/savevm.c b/migration/savevm.c
> index a9181b444b..2740defdf0 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -71,6 +71,13 @@
>  
>  const unsigned int postcopy_ram_discard_version;
>  
> +typedef struct {
> +    uint8_t general_enable;

I miss a comment for this field.

I think that you only use the values 0 and 1
And that 1 means something like: we require this feature and do nothing
And that 0 means that this is a device that uses the feature and
<something, something>

> +    uint8_t reserved[7];
> +    uint8_t idstr[256];
> +    uint32_t instance_id;
> +} InitialDataInfo;

We have several "reserved" space here.  Do we want a Version field?
It don't seem that we need a size field, as the command is fixed length.

> @@ -90,6 +97,8 @@ enum qemu_vm_cmd {
>      MIG_CMD_ENABLE_COLO,       /* Enable COLO */
>      MIG_CMD_POSTCOPY_RESUME,   /* resume postcopy on dest */
>      MIG_CMD_RECV_BITMAP,       /* Request for recved bitmap on dst */
> +

Spurious blank line

> +    MIG_CMD_INITIAL_DATA_ENABLE, /* Enable precopy initial data in dest */
>      MIG_CMD_MAX



> +void qemu_savevm_send_initial_data_enable(MigrationState *ms, QEMUFile *f)
> +{
> +    SaveStateEntry *se;
> +    InitialDataInfo buf;

Small nit.

The new way in the block to declare that something needs to be
initialized to zero is:

    InitialDataInfo buf = {};

And no, I have no clue if this makes the compiler generate any better code.

> +    /* Enable precopy initial data generally in the migration */
> +    memset(&buf, 0, sizeof(buf));
> +    buf.general_enable = 1;
> +    qemu_savevm_command_send(f, MIG_CMD_INITIAL_DATA_ENABLE, sizeof(buf),
> +                             (uint8_t *)&buf);
> +    trace_savevm_send_initial_data_enable(buf.general_enable, (char *)buf.idstr,
> +                                          buf.instance_id);

No buf.idstr here.

Why do we need a command before the loop and seeing if we are having any
device that requires this.

> +    /* Enable precopy initial data for each migration user that supports it */
> +    QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
> +        if (!se->ops || !se->ops->initial_data_advise) {
> +            continue;
> +        }
> +
> +        if (!se->ops->initial_data_advise(se->opaque)) {
> +            continue;
> +        }

Is this callback going to send anything?

> +
> +        memset(&buf, 0, sizeof(buf));
> +        memcpy(buf.idstr, se->idstr, sizeof(buf.idstr));
> +        buf.instance_id = se->instance_id;
> +
> +        qemu_savevm_command_send(f, MIG_CMD_INITIAL_DATA_ENABLE, sizeof(buf),
> +                                 (uint8_t *)&buf);
> +        trace_savevm_send_initial_data_enable(
> +            buf.general_enable, (char *)buf.idstr, buf.instance_id);

It is me or general_enable is always zero here?

> +    }
> +}
> +
>  void qemu_savevm_send_colo_enable(QEMUFile *f)
>  {
>      trace_savevm_send_colo_enable();
> @@ -2314,6 +2359,60 @@ static int loadvm_process_enable_colo(MigrationIncomingState *mis)
>      return ret;
>  }
>  
> +static int loadvm_handle_initial_data_enable(MigrationIncomingState *mis)
> +{
> +    InitialDataInfo buf;
> +    SaveStateEntry *se;
> +    ssize_t read_size;
> +
> +    read_size = qemu_get_buffer(mis->from_src_file, (void *)&buf, sizeof(buf));
> +    if (read_size != sizeof(buf)) {
> +        error_report("%s: Could not get data buffer, read_size %ld, len %lu",
> +                     __func__, read_size, sizeof(buf));
> +
> +        return -EIO;
> +    }
> +
> +    /* Enable precopy initial data generally in the migration */
> +    if (buf.general_enable) {
> +        mis->initial_data_enabled = true;
> +        trace_loadvm_handle_initial_data_enable(
> +            buf.general_enable, (char *)buf.idstr, buf.instance_id);
> +
> +        return 0;
> +    }
> +
> +    /* Enable precopy initial data for a specific migration user */
> +    se = find_se((char *)buf.idstr, buf.instance_id);
> +    if (!se) {
> +        error_report("%s: Could not find SaveStateEntry, idstr '%s', "
> +                     "instance_id %" PRIu32,
> +                     __func__, buf.idstr, buf.instance_id);
> +
> +        return -ENOENT;
> +    }
> +
> +    if (!se->ops || !se->ops->initial_data_advise) {
> +        error_report("%s: '%s' doesn't have required "
> +                     "initial_data_advise op",
> +                     __func__, buf.idstr);
> +
> +        return -EOPNOTSUPP;
> +    }
> +
> +    if (!se->ops->initial_data_advise(se->opaque)) {
> +        error_report("%s: '%s' doesn't support precopy initial data", __func__,
> +                     buf.idstr);

This is not your fault.  Just venting.

And here we are, again, with a place where we can't return errors.  Sniff.

> +
> +        return -EOPNOTSUPP;
> +    }

I have to wait until I see the usage later in the series, but it is a
good idea to have a single handle for source and destination, and not
passing at least a parameter telling where are we?

Really nice patch, very good done and very good integrated with the
surrounded style.  A pleasure.

Later, Juan.


