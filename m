Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D93628EA1
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:46:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouir8-0004Je-E5; Mon, 14 Nov 2022 18:27:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ouigz-0006aC-P4
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:16:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ouVhZ-0004He-Oe
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 04:24:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668417864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=kbl99lguRL8jSDVXEVrxyWrPp8EOVduq8tRektrEYaE=;
 b=hFgCH0+VSKpRgIhn2uhBv9tr+57ZFRZ6ZiN04C0ABHM8gdXdm6uWxhafOwUpVcr6ngljEX
 //GJTSjO3Uq/1Ic1CgDoPPyfafWMJ8BVr1rV6lMyr9zyi7fURS6fjmKfNdksLtw9SD0Pl8
 bqyQO5p2FYEPhJ4vnT0PRGg5QLrV6qw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-6-8PNE-l7TNXuTVXW0VzO3bw-1; Mon, 14 Nov 2022 04:24:21 -0500
X-MC-Unique: 8PNE-l7TNXuTVXW0VzO3bw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DFD6785A5B6;
 Mon, 14 Nov 2022 09:24:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AC0862166B2B;
 Mon, 14 Nov 2022 09:24:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 76F8821E6921; Mon, 14 Nov 2022 10:24:17 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: Ugly QOM property names: paths within paths
Date: Mon, 14 Nov 2022 10:24:17 +0100
Message-ID: <87iljh51oe.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

I noticed this the other day:

    (qemu) info qom-tree 
    /machine (pc-i440fx-7.2-machine)
      /fw_cfg (fw_cfg_io)
        /\x2from@etc\x2facpi\x2frsdp[0] (memory-region)b
        /\x2from@etc\x2facpi\x2ftables[0] (memory-region)
        /\x2from@etc\x2ftable-loader[0] (memory-region)
        /fwcfg.dma[0] (memory-region)
        /fwcfg[0] (memory-region)
    [...]

It took me a minute to realize that the "\x2" in these property names
are escaped forms of '/'.  I.e. the unescaped path components of the
first property path are

    machine
    fw_cfg
    /from@etc/facpi/frsdp[0]

We're embedding paths within paths.  Ugh!

The escaping happens in memory_region_init():

    static bool memory_region_need_escape(char c)
    {
        return c == '/' || c == '[' || c == '\\' || c == ']';
    }

    static char *memory_region_escape_name(const char *name)
    {
        const char *p;
        char *escaped, *q;
        uint8_t c;
        size_t bytes = 0;

        for (p = name; *p; p++) {
            bytes += memory_region_need_escape(*p) ? 4 : 1;
        }
        if (bytes == p - name) {
           return g_memdup(name, bytes + 1);
        }

        escaped = g_malloc(bytes + 1);
        for (p = name, q = escaped; *p; p++) {
            c = *p;
            if (unlikely(memory_region_need_escape(c))) {
                *q++ = '\\';
                *q++ = 'x';
                *q++ = "0123456789abcdef"[c >> 4];
                c = "0123456789abcdef"[c & 15];
            }
            *q++ = c;
        }
        *q = 0;
        return escaped;
    }

    static void memory_region_do_init(MemoryRegion *mr,
                                      Object *owner,
                                      const char *name,
                                      uint64_t size)
    {
        mr->size = int128_make64(size);
        if (size == UINT64_MAX) {
            mr->size = int128_2_64();
        }
        mr->name = g_strdup(name);
        mr->owner = owner;
        mr->ram_block = NULL;

        if (name) {
            char *escaped_name = memory_region_escape_name(name);
            char *name_array = g_strdup_printf("%s[*]", escaped_name);

            if (!owner) {
                owner = container_get(qdev_get_machine(), "/unattached");
            }

            object_property_add_child(owner, name_array, OBJECT(mr));
            object_unref(OBJECT(mr));
            g_free(name_array);
            g_free(escaped_name);
        }
    }

    void memory_region_init(MemoryRegion *mr,
                            Object *owner,
                            const char *name,
                            uint64_t size)
    {
        object_initialize(mr, sizeof(*mr), TYPE_MEMORY_REGION);
        memory_region_do_init(mr, owner, name, size);
    }

Goes back to

    commit b4fefef9d52003b6d09866501275a9a57995c6b0
    Author: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
    Date:   Thu Jun 5 23:15:52 2014 -0700

        memory: MemoryRegion: QOMify

        QOMify memory regions as an Object. The former init() and destroy()
        routines become instance_init() and instance_finalize() resp.

        memory_region_init() is re-implemented to be:
        object_initialize() + set fields

        memory_region_destroy() is re-implemented to call unparent().

        Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
        [Add newly-created MR as child, unparent on destruction. - Paolo]
        Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

No mention of the escapery.

Questions:

1. Do we really want to embed slash-separated paths into slash-separated
   paths?

2. As far as I can tell, object.c does not guard against "funny"
   characters such as '/' in path components.  Should it?  For what it's
   worth, the kernel doesn't permit '/' in filenames.

3. Should the escapery live in object.c instead of memory.c?


