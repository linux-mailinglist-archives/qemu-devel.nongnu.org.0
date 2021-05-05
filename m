Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3DE374754
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 19:57:16 +0200 (CEST)
Received: from localhost ([::1]:41042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leLlr-0003wP-JB
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 13:57:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1leLjJ-00033b-6r
 for qemu-devel@nongnu.org; Wed, 05 May 2021 13:54:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1leLjF-0000nr-MG
 for qemu-devel@nongnu.org; Wed, 05 May 2021 13:54:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620237272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NdW9Zi1T+f3fzX2fRJLE/kim+RxVMv4R5nc9KJjrpJ8=;
 b=CrJFczoY2ZZM+fGXFpkpM8UBe+sbvP4X/cuoz1mBrD1SjOwfhQumTpWsJRmAeg3GpVemU6
 Z/uMzg93lgx8xQmGy7QbqtKwCNzikyZNczde8Tz9h3hOETwZa5z6X83mqTBRku8U8t/NlM
 u13f9jTfaF7/sNe1QFkuz/XmG3oakg0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-FmyHM5CEP8m6oIaMXOo4MQ-1; Wed, 05 May 2021 13:54:30 -0400
X-MC-Unique: FmyHM5CEP8m6oIaMXOo4MQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76626106BB24;
 Wed,  5 May 2021 17:54:29 +0000 (UTC)
Received: from work-vm (ovpn-115-97.ams2.redhat.com [10.36.115.97])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 566C060864;
 Wed,  5 May 2021 17:54:19 +0000 (UTC)
Date: Wed, 5 May 2021 18:54:16 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: vhost-user payload union restrictions ?
Message-ID: <YJLbyERdbaFBwgg+@work-vm>
References: <YJKRUp8E+J7OSCgg@work-vm>
 <CAJ+F1CLZedsd4X9x5iLoaNNUXSqvet-AKOb-LNsuBjkqfnB3vg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CLZedsd4X9x5iLoaNNUXSqvet-AKOb-LNsuBjkqfnB3vg@mail.gmail.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 vgoyal@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Marc-André Lureau (marcandre.lureau@gmail.com) wrote:
> Hi
> 
> On Wed, May 5, 2021 at 4:38 PM Dr. David Alan Gilbert <dgilbert@redhat.com>
> wrote:
> 
> > (Resend, remembering to add list)
> > Hi,
> >   I'm trying to understand what restrictions there are on the
> > payload that's part of VhostUserMsg; and am confused by
> > inconsistencies.
> >
> > Lets start with this version:
> >
> > subprojects/libvhost-user/libvhost-user.h :
> > typedef struct VhostUserMsg {
> >     int request;
> >
> > #define VHOST_USER_VERSION_MASK     (0x3)
> > #define VHOST_USER_REPLY_MASK       (0x1 << 2)
> > #define VHOST_USER_NEED_REPLY_MASK  (0x1 << 3)
> >     uint32_t flags;
> >     uint32_t size; /* the following payload size */
> >
> >     union {
> > #define VHOST_USER_VRING_IDX_MASK   (0xff)
> > #define VHOST_USER_VRING_NOFD_MASK  (0x1 << 8)
> >         uint64_t u64;
> >         struct vhost_vring_state state;
> >         struct vhost_vring_addr addr;
> >         VhostUserMemory memory;
> >         VhostUserMemRegMsg memreg;
> >         VhostUserLog log;
> >         VhostUserConfig config;
> >         VhostUserVringArea area;
> >         VhostUserInflight inflight;
> >     } payload;
> >
> >     int fds[VHOST_MEMORY_BASELINE_NREGIONS];
> >     int fd_num;
> >     uint8_t *data;
> > } VU_PACKED VhostUserMsg;
> >
> > note the 'fds' array after the payload but before
> > the end of the structure.
> >
> > But then there's the version in:
> > hw/virtio/vhost-user.c
> > typedef union {
> > #define VHOST_USER_VRING_IDX_MASK   (0xff)
> > #define VHOST_USER_VRING_NOFD_MASK  (0x1<<8)
> >         uint64_t u64;
> >         struct vhost_vring_state state;
> >         struct vhost_vring_addr addr;
> >         VhostUserMemory memory;
> >         VhostUserMemRegMsg mem_reg;
> >         VhostUserLog log;
> >         struct vhost_iotlb_msg iotlb;
> >         VhostUserConfig config;
> >         VhostUserCryptoSession session;
> >         VhostUserVringArea area;
> >         VhostUserInflight inflight;
> > } VhostUserPayload;
> >
> > typedef struct VhostUserMsg {
> >     VhostUserHeader hdr;
> >     VhostUserPayload payload;
> > } QEMU_PACKED VhostUserMsg;
> >
> > which hasn't got the 'fds' section.
> > Yet they're both marked as 'packed'.
> >
> 
> They are packed, because both are used to serialize/deserialize the stream.

The header is (de)serialized and the payload is; but we don't ever try
and deal with both at the same time do we ? We read the header, check
the length, read the payload; so isn't it really each part is packed and
not the whole?

> 
> > That's a bit unfortunate for two structures with the same name.
> >
> >
> Yes, maybe it's time to have a canonical system header used by both?

Any idea where that would live?  I think the problem is that in some
respects the libvhost_user.h is the right place, but it's now formally a
separate/sub project.

> > Am I right in thinking that the vhost-user.c version is sent over
> > the wire, while the libvhost-user.h one is really just an interface?
> >
> >
> I believe the extra fields are not used for serializing the message, but
> just a convenient way to group related data.

OK

> > Is it safe for me to add a new, larger entry in the payload union
> > without breaking existing clients?
> >
> 
> It should be.

Good.

> > I ended up at this question after trying to add a variable length
> > entry to the union:
> >
> > typedef struct {
> >     VhostUserFSSlaveMsg fs;
> >     VhostUserFSSlaveMsgEntry entries[VHOST_USER_FS_SLAVE_MAX_ENTRIES];
> > } QEMU_PACKED VhostUserFSSlaveMsgMax;
> >
> > ...
> > union ....
> >         VhostUserFSSlaveMsg fs;
> >         VhostUserFSSlaveMsgMax fs_max; /* Never actually used */
> > } VhostUserPayload;
> >
> > and in the .h I had:
> > typedef struct {
> >     /* Generic flags for the overall message */
> >     uint32_t flags;
> >     /* Number of entries */
> >     uint16_t count;
> >     /* Spare */
> >     uint16_t align;
> >
> >     VhostUserFSSlaveMsgEntry entries[];
> > } VhostUserFSSlaveMsg;
> >
> >     union {
> > ...
> >         VhostUserInflight inflight;
> >         VhostUserFSSlaveMsg fs;
> >     } payload;
> >
> > which is apparently OK in the .c version, and gcc is happy with the same
> > in the libvhost-user.h version; but clang gets upset by the .h
> > version because it doesn't like the variable length structure
> > before the end of the struct - which I have sympathy for.
> >
> >
> Indeed, we probably want to allocate the message separately then.

I'm thinking that wecould change the libvhost-user.h to be:

(as the C file)

typedef struct VhostUserMsg {
    VhostUserHeader hdr;
    VhostUserPayload payload;
} VU_PACKED VhostUserMsgWire;

typedef struct VhostUserMsgExt {
    int fds[VHOST_MEMORY_BASELINE_NREGIONS];
    int fd_num;
    uint8_t *data;
    VhostUserMsgWire msg;
} VhostUserMsg;

Dave


> thanks
> 
> -- 
> Marc-André Lureau
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


