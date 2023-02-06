Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BCD68BD03
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 13:36:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP0jA-0004fK-5I; Mon, 06 Feb 2023 07:36:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pP0in-0004W8-Dk
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 07:35:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pP0ij-0001Iz-Dv
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 07:35:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675686937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SR3JdnlJDOw/nUy9InxCO4dantX6P96RUrHJEt4/XbQ=;
 b=iZQ4p1fLqaCd3bTnj2XTnTA1oFRxGbz6K5+0RnAYfz2qYQrq4B5puGIrm5CFSQlqJfKy1P
 K564XZVvILg/DYSqZiPFuO8Ihov8drQfhtB/ZGF9FOE193MaPcTAnXMa9Jh+w5iirV/Jwn
 UFV/F7CLa3qgWNqhphfVnTsxpPvedSo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-626-IpbriS13OdmS134QB5z67A-1; Mon, 06 Feb 2023 07:35:35 -0500
X-MC-Unique: IpbriS13OdmS134QB5z67A-1
Received: by mail-wm1-f71.google.com with SMTP id
 fl9-20020a05600c0b8900b003dfe4bae099so5251578wmb.0
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 04:35:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:from:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=SR3JdnlJDOw/nUy9InxCO4dantX6P96RUrHJEt4/XbQ=;
 b=6Y/hAGVlUXX2Enb4CJwmi5+TkjVunColZ563etrUyppYnAC4OfkG8kUrsz0FwK0vXN
 PLsqRe/OgAv5i5C2CJh5jdHKIsdSdxkqg3KujK7JuKhnHMI86GvoXxBYKubsjsNIsYTI
 gcH3G1FH7hmwQdd153jDzZKnG0j9Qd6LLtWCWr+hXYwHR+frGRBktzifBG+7ABo5gfNT
 r8uGLDcsdB+NWCx1OrIGRzBx1RxAG2Lvhp2q+bPuhTTByv2bfqaFenhYIywQiTBO/Huq
 ivzoyC1MBvTdhWdMmJouIImpdLMf8fiazYku+WnDNNRmx8RjOhEaPVQkX632B8481p0R
 Jieg==
X-Gm-Message-State: AO0yUKVehZ8ttXWlX4actqwWl1e54vJngFOEncD00gaRuNeodV8uctfu
 6wpRmm3CrIzez9Z/DIizX7JkHNniEyT6TQxM0x4W49ZkbCfxSLOxmRwoV2F9FLcgiAtWSRLXwQ4
 ioj2+9v5L6N5kCD8=
X-Received: by 2002:a05:600c:c17:b0:3dc:3b29:7a4 with SMTP id
 fm23-20020a05600c0c1700b003dc3b2907a4mr10753339wmb.0.1675686934561; 
 Mon, 06 Feb 2023 04:35:34 -0800 (PST)
X-Google-Smtp-Source: AK7set9D7pyiU9jOWUcPz9N7w1qY93NaIfbMe0L/MK6sDyCwEy/nWXu/qYoGgZ5rSbew64yWqQgu1Q==
X-Received: by 2002:a05:600c:c17:b0:3dc:3b29:7a4 with SMTP id
 fm23-20020a05600c0c1700b003dc3b2907a4mr10753333wmb.0.1675686934422; 
 Mon, 06 Feb 2023 04:35:34 -0800 (PST)
Received: from ?IPV6:2003:cf:d72e:fd7:26ff:71e9:ed84:bdc0?
 (p200300cfd72e0fd726ff71e9ed84bdc0.dip0.t-ipconnect.de.
 [2003:cf:d72e:fd7:26ff:71e9:ed84:bdc0])
 by smtp.gmail.com with ESMTPSA id
 z17-20020a7bc7d1000000b003dc3f07c876sm16250503wmk.46.2023.02.06.04.35.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 04:35:33 -0800 (PST)
Message-ID: <fb523956-7a8c-608b-6db1-961686b73e9c@redhat.com>
Date: Mon, 6 Feb 2023 13:35:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
From: Hanna Czenczek <hreitz@redhat.com>
Subject: vhost-user (virtio-fs) migration: back end state
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: virtio-fs-list <virtio-fs@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
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

Hi Stefan,

For true virtio-fs migration, we need to migrate the daemon’s (back 
end’s) state somehow.  I’m addressing you because you had a talk on this 
topic at KVM Forum 2021. :)

As far as I understood your talk, the only standardized way to migrate a 
vhost-user back end’s state is via dbus-vmstate.  I believe that 
interface is unsuitable for our use case, because we will need to 
migrate more than 1 MB of state.  Now, that 1 MB limit has supposedly 
been chosen arbitrarily, but the introducing commit’s message says that 
it’s based on the idea that the data must be supplied basically 
immediately anyway (due to both dbus and qemu migration requirements), 
and I don’t think we can meet that requirement.

Has there been progress on the topic of standardizing a vhost-user back 
end state migration channel besides dbus-vmstate?  I’ve looked around 
but didn’t find anything.  If there isn’t anything yet, is there still 
interest in the topic?

Of course, we could use a channel that completely bypasses qemu, but I 
think we’d like to avoid that if possible.  First, this would require 
adding functionality to virtiofsd to configure this channel.  Second, 
not storing the state in the central VM state means that migrating to 
file doesn’t work (well, we could migrate to a dedicated state file, 
but...).  Third, setting up such a channel after virtiofsd has sandboxed 
itself is hard.  I guess we should set up the migration channel before 
sandboxing, which constrains runtime configuration (basically this would 
only allow us to set up a listening server, I believe).  Well, and 
finally, it isn’t a standard way, which won’t be great if we’re planning 
to add a standard way anyway.

Thanks!

Hanna


