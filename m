Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 249CB3A272E
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 10:35:54 +0200 (CEST)
Received: from localhost ([::1]:48160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrGAK-0002G8-RH
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 04:35:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lrG7L-0007fB-RM; Thu, 10 Jun 2021 04:32:47 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:45712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lrG7I-0000tv-SH; Thu, 10 Jun 2021 04:32:47 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 55919219A2;
 Thu, 10 Jun 2021 08:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623313960; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cApVqjfvN/BziC0s1wLj5pAE3zVAFPC16GcVCfzPANI=;
 b=NDl0YIQbnpaKFO+XP8NZT+qBNJIwH2ghq+OEY6UbZ/2gFVvo+souzN7NWsWLoBr5+MpUop
 JMM+VUqvMscAlYUmy/tB1itRLTt7dN2L9U+tYepVzcoWsc+FZGfhfuxWmVXQOL4vkirAL9
 U3s3wow5RJNTRPKNlK9V/AZpULoRyM4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623313960;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cApVqjfvN/BziC0s1wLj5pAE3zVAFPC16GcVCfzPANI=;
 b=bU9+hv7k5JDjaC0maPcQG/ikzvWoQT8e26k6n86U4ju/kJEK6pxfVoPh28rcYc1cd5iEfH
 na7Sbog3VP4K3SCA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id ABB41118DD;
 Thu, 10 Jun 2021 08:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623313960; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cApVqjfvN/BziC0s1wLj5pAE3zVAFPC16GcVCfzPANI=;
 b=NDl0YIQbnpaKFO+XP8NZT+qBNJIwH2ghq+OEY6UbZ/2gFVvo+souzN7NWsWLoBr5+MpUop
 JMM+VUqvMscAlYUmy/tB1itRLTt7dN2L9U+tYepVzcoWsc+FZGfhfuxWmVXQOL4vkirAL9
 U3s3wow5RJNTRPKNlK9V/AZpULoRyM4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623313960;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cApVqjfvN/BziC0s1wLj5pAE3zVAFPC16GcVCfzPANI=;
 b=bU9+hv7k5JDjaC0maPcQG/ikzvWoQT8e26k6n86U4ju/kJEK6pxfVoPh28rcYc1cd5iEfH
 na7Sbog3VP4K3SCA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 1Rp0KCfOwWDZGgAALh3uQQ
 (envelope-from <cfontana@suse.de>); Thu, 10 Jun 2021 08:32:39 +0000
Subject: Re: [PATCH v2 00/18] modules: add metadata database
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20210610055755.538119-1-kraxel@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <dd1c5487-b1bf-9e33-fd42-fc0863e0ddd7@suse.de>
Date: Thu, 10 Jun 2021 10:32:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210610055755.538119-1-kraxel@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 berrange@redhat.com, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?Q?Jos=c3=a9_Ricardo_Ziviani?= <jose.ziviani@suse.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Lieven <pl@kamp.de>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/10/21 7:57 AM, Gerd Hoffmann wrote:
> This patch series adds support for module metadata.  Here are the pieces
> of the puzzle:
> 
>   (1) Macros are added to store metadata in a .modinfo elf section
>       (idea stolen from the linux kernel).
>   (2) A utility to scan modules, collect metadata from the .modinfo
>       sections, store it in a file (modinfo.json) for later consumption
>       by qemu.  Can also be easily inspected using 'jq'.
>   (3) Adding annotations to the modules we have.
>   (4) Drop hard-coded lists from utils/module.c
> 
> take care,
>   Gerd

The background has disappeared compared with V1.

V1 says:

"Background is that the hard-coded lists in util/module.c are somewhat
ugly and also wouldn't work very well with a large number of modules,
so I'm looking for something else."

Can you write more about what the actual high level goals of this series are?

We are in general making QEMU more and more difficult to get into,
requiring more and more investment for new contributors to get productive.

Is the additional complexity justified? What is the benefit, and is simplification a goal of the series as well?


> 
> Gerd Hoffmann (18):
>   modules: add metadata macros, add qxl module annotations
>   qapi: add ModuleInfo schema
>   modules: add qemu-modinfo utility
>   modules: add virtio-gpu module annotations
>   modules: add chardev module annotations
>   modules: add audio module annotations
>   modules: add usb-redir module annotations
>   modules: add ccid module annotations
>   modules: add ui module annotations
>   modules: add s390x module annotations
>   modules: add block module annotations
>   modules: add module_load_path_init helper
>   modules: load modinfo.json
>   modules: use modinfo for dependencies
>   modules: use modinfo for qom load
>   modules: use modinfo for qemu opts load
>   modules: check arch and block load on mismatch
>   [fixup] module_load_modinfo
> 
>  include/qemu/module.h           |  23 +++
>  audio/spiceaudio.c              |   2 +
>  block/iscsi-opts.c              |   1 +
>  chardev/baum.c                  |   1 +
>  chardev/spice.c                 |   4 +
>  hw/display/qxl.c                |   4 +
>  hw/display/vhost-user-gpu-pci.c |   1 +
>  hw/display/vhost-user-gpu.c     |   1 +
>  hw/display/vhost-user-vga.c     |   1 +
>  hw/display/virtio-gpu-base.c    |   1 +
>  hw/display/virtio-gpu-gl.c      |   3 +
>  hw/display/virtio-gpu-pci-gl.c  |   3 +
>  hw/display/virtio-gpu-pci.c     |   2 +
>  hw/display/virtio-gpu.c         |   1 +
>  hw/display/virtio-vga-gl.c      |   3 +
>  hw/display/virtio-vga.c         |   2 +
>  hw/s390x/virtio-ccw-gpu.c       |   3 +
>  hw/usb/ccid-card-emulated.c     |   1 +
>  hw/usb/ccid-card-passthru.c     |   1 +
>  hw/usb/redirect.c               |   1 +
>  qemu-modinfo.c                  | 270 ++++++++++++++++++++++++++++++
>  softmmu/vl.c                    |  20 +--
>  stubs/module-opts.c             |   4 -
>  ui/egl-headless.c               |   4 +
>  ui/gtk.c                        |   4 +
>  ui/sdl2.c                       |   4 +
>  ui/spice-app.c                  |   3 +
>  ui/spice-core.c                 |   5 +
>  util/module.c                   | 282 +++++++++++++++++++-------------
>  meson.build                     |  11 ++
>  qapi/meson.build                |   1 +
>  qapi/modules.json               |  36 ++++
>  qapi/qapi-schema.json           |   1 +
>  util/trace-events               |   3 +
>  34 files changed, 576 insertions(+), 131 deletions(-)
>  create mode 100644 qemu-modinfo.c
>  create mode 100644 qapi/modules.json
> 


