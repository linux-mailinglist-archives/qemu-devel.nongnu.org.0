Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 567146F714C
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:42:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pucoN-0006y4-GW; Thu, 04 May 2023 13:32:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pubTA-0003uK-Gf
 for qemu-devel@nongnu.org; Thu, 04 May 2023 12:06:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pubT8-0006d2-DC
 for qemu-devel@nongnu.org; Thu, 04 May 2023 12:06:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683216361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=evUYBb5bab6FQEkQrRMiUed6IK05Yeb0VtTkFNioU1Y=;
 b=Jw+JdwsVeQgLvWKN3ptWTkQaGUCTLXE7pg/7Nf4bjF3l6LZvnuYFTrAaDPvFOVw8BTDQgj
 T1KWjQSOESmra0Wy3wEAosR5Knd/G3srl5SHDc+tVMkBqPw+ehsQcW30MdiqGrQJ1SYeZ4
 +RUCk8vI3VWmhQN/kVi3LjjvgLED6eE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-575-641JvJCdNI2y5-rJ6OAcmA-1; Thu, 04 May 2023 12:05:54 -0400
X-MC-Unique: 641JvJCdNI2y5-rJ6OAcmA-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-50bc6c6b9dbso7235359a12.0
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 09:05:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683216349; x=1685808349;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=evUYBb5bab6FQEkQrRMiUed6IK05Yeb0VtTkFNioU1Y=;
 b=VB9wKYaG9qXZ35RUTghqu3em1wUnQ6Ul1mH+rWV4BX0+qRBaj5PGufH/pdg9OGPXP/
 DvQv5o75bskF/PFmLrXdofkuBPW7VN3oKrUa4gyQlVRfKY8mMqMlyOcgfey2Az3q9eal
 v6oD3zOQ+06CLHjcyQQxg1eccPs7kfW66y5kqY74pyNnG0m10GlooKaiHY2ULH5+VZ/9
 cdTcDyw/A6qC8jk1FmoxRVwvlBvktgEckaPWk4dgvwR7ll/C4CkCIWwa1D0nXr5ARrLg
 xAvkkIW13Gtto8lzFVYUccUlMd798r8qB6DzWpzHpqr7MRBV++26+vHpIQq+bOgQ8A4h
 9fng==
X-Gm-Message-State: AC+VfDxnS4P/5usOMw77WbNDiYUWJdp/TZYJ+v8B1qswqGvRcxFp166E
 8JqzsPQF7SaTW64PPSew8roxGjSH8anYnUl5UPq7Jtci6Qqvv1TnSyPxuhu1sX13kfnRJ0Y7A9s
 EpfMiHonO9R6fcqSfrQ3/Gpa2xbPiLgqvs7qXZ6fwzUyV+7X+y69PcPJf9+Fyx5yDvBdv3vZe
X-Received: by 2002:a17:907:7ea7:b0:965:77d2:7802 with SMTP id
 qb39-20020a1709077ea700b0096577d27802mr4065108ejc.0.1683216349012; 
 Thu, 04 May 2023 09:05:49 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4DLZUFC/RWTvNHjaWrOADvZhTJUTD8+AhKihdvWhX1Z/e3E7VLylz6BRk9fUiu7AiYzlFaZQ==
X-Received: by 2002:a17:907:7ea7:b0:965:77d2:7802 with SMTP id
 qb39-20020a1709077ea700b0096577d27802mr4065064ejc.0.1683216348559; 
 Thu, 04 May 2023 09:05:48 -0700 (PDT)
Received: from ?IPV6:2003:cf:d738:349d:2ac7:7f11:643a:99c0?
 (p200300cfd738349d2ac77f11643a99c0.dip0.t-ipconnect.de.
 [2003:cf:d738:349d:2ac7:7f11:643a:99c0])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a170906594a00b008cecb8f374asm18773710ejr.0.2023.05.04.09.05.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 May 2023 09:05:47 -0700 (PDT)
Message-ID: <e8cc4521-50a1-2e38-1fb3-8cfa7b0c967e@redhat.com>
Date: Thu, 4 May 2023 18:05:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 0/4] vhost-user-fs: Internal migration
To: qemu-devel@nongnu.org, virtio-fs@redhat.com
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 German Maglione <gmaglione@redhat.com>,
 Anton Kuchin <antonkuchin@yandex-team.ru>,
 Juan Quintela <quintela@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Eugenio Perez Martin <eperezma@redhat.com>
References: <20230411150515.14020-1-hreitz@redhat.com>
Content-Language: en-US
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <20230411150515.14020-1-hreitz@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.28, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11.04.23 17:05, Hanna Czenczek wrote:

[...]

> Hanna Czenczek (4):
>    vhost: Re-enable vrings after setting features
>    vhost-user: Interface for migration state transfer
>    vhost: Add high-level state save/load functions
>    vhost-user-fs: Implement internal migration

I’m trying to write v2, and my intention was to keep the code 
conceptually largely the same, but include in the documentation change 
thoughts and notes on how this interface is to be used in the future, 
when e.g. vDPA “extensions” come over to vhost-user.  My plan was to, 
based on that documentation, discuss further.

But now I’m struggling to even write that documentation because it’s not 
clear to me what exactly the result of the discussion was, so I need to 
stop even before that.

So as far as I understand, we need/want SUSPEND/RESUME for two reasons:
1. As a signal to the back-end when virt queues are no longer to be 
processed, so that it is clear that it will not do that when asked for 
migration state.
2. Stateful devices that support SET_STATUS receive a status of 0 when 
the VM is stopped, which supposedly resets the internal state. While 
suspended, device state is frozen, so as far as I understand, SUSPEND 
before SET_STATUS would have the status change be deferred until RESUME.

I don’t want to hang myself up on 2 because it doesn’t really seem 
important to this series, but: Why does a status of 0 reset the internal 
state?  [Note: This is all virtio_reset() seems to do, set the status to 
0.]  The vhost-user specification only points to the virtio 
specification, which doesn’t say anything to that effect. Instead, an 
explicit device reset is mentioned, which would be 
VHOST_USER_RESET_DEVICE, i.e. something completely different. Because 
RESET_DEVICE directly contradicts SUSPEND’s description, I would like to 
think that invoking RESET_DEVICE on a SUSPEND-ed device is just invalid.

Is it that a status 0 won’t explicitly reset the internal state, but 
because it does mean that the driver is unbound, the state should 
implicitly be reset?

Anyway.  1 seems to be the relevant point for migration.  As far as I 
understand, currently, a vhost-user back-end has no way of knowing when 
to stop processing virt queues.  Basically, rings can only transition 
from stopped to started, but not vice versa.  The vhost-user 
specification has this bit: “Once the source has finished migration, 
rings will be stopped by the source. No further update must be done 
before rings are restarted.”  It just doesn’t say how the front-end lets 
the back-end know that the rings are (to be) stopped.  So this seems 
like a pre-existing problem for stateless migration.  Unless this is 
communicated precisely by setting the device status to 0?

Naturally, what I want to know most of all is whether you believe I can 
get away without SUSPEND/RESUME for now.  To me, it seems like honestly 
not really, only when turning two blind eyes, because otherwise we can’t 
ensure that virtiofsd isn’t still processing pending virt queue requests 
when the state transfer is begun, even when the guest CPUs are already 
stopped.  Of course, virtiofsd could stop queue processing right there 
and then, but…  That feels like a hack that in the grand scheme of 
things just isn’t necessary when we could “just” introduce 
SUSPEND/RESUME into vhost-user for exactly this.

Beyond the SUSPEND/RESUME question, I understand everything can stay 
as-is for now, as the design doesn’t seem to conflict too badly with 
possible future extensions for other migration phases or more finely 
grained migration phase control between front-end and back-end.

Did I at least roughly get the gist?

Hanna


