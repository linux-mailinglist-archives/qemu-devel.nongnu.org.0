Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E5635A5D0
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 20:32:49 +0200 (CEST)
Received: from localhost ([::1]:50186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUvw0-0000Zz-3n
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 14:32:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cminyard@mvista.com>)
 id 1lUvuc-00080X-8i
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 14:31:26 -0400
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e]:35587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cminyard@mvista.com>)
 id 1lUvua-0007Ct-Fv
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 14:31:21 -0400
Received: by mail-oi1-x22e.google.com with SMTP id x2so6714534oiv.2
 for <qemu-devel@nongnu.org>; Fri, 09 Apr 2021 11:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mvista-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=Qqac6+aH4uhjP9YK4h95DF0MHcvTH/SZ25/HubAq0lg=;
 b=wqn7eqEBiNiQVrbdNYw0XWCgr/CL643GPFstyRrt7LyG9GbuyuWNUs1wifOIcaPqnd
 GdVvEl91lyW2W3WCFZrDH3PeI06FSOlPNCzSpV3xug4rWyEdWPQ4gnleRahka7cdRF9A
 HIEpbrJjQ0HY8cdY0kIwoZKXGPt+sGMsavaNngR50TCTkbqQm+nBWJNxyjA0v4PoeNTe
 UCyvVAuRov4tVgKs8xpGsxmIQohwJzL+WJM/EbFDAlb1KHMVBZ7FZgk0cxtacmEiH6ih
 9lMzci1il2kTYw52OVnQ/93sK6LEo5nuUTUVWJNXUp5o8RdEZy4DaWFXi8SQQ06IFCk5
 QHMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=Qqac6+aH4uhjP9YK4h95DF0MHcvTH/SZ25/HubAq0lg=;
 b=Qx+vP6mxHZFXRbs/rdV5wDWqQR64Tcw7ZHH3GE02ScIcJ+lXEhT1s7A3mtYRxTq22J
 hZ8WCiOYRaJBKIbea+GREc9FFyl+fSJMTe3dsBkHjIXDMObrwDUPzmXfcabsUdL5ARzP
 knTLc3I3g9e6VMZkFO0O/xCfHZDcXvIbn4NDVZHEPLrqLZ97UdaeytDRDFFz/rtnXl5E
 3VG1uXsu1HryCD32GR2yNrhTMkl8RTbeFsg7AxOwW1zP8ByG7L8eiakMhjijhSB/VgXA
 hmyT+UeglLzUzK/9jc7gx3h6sBzWVa3TBYSUUTKPLKwImDKBllep7Cf1xez7U5ObFGF0
 o6sw==
X-Gm-Message-State: AOAM5314RaEq7vtjHLUPbRzuXIaeg8N4XHRIA8/VxuOuU11+GMnbt2Jz
 29ykwGzHBuHqEsCOXNOACWGSVQ==
X-Google-Smtp-Source: ABdhPJxlwO4dGhCmYh6z1GHN3axPT5Xuuk0j2gYFgKFgdxrHU73LaffS/8zrfDtSj24vtH/vpR4gMw==
X-Received: by 2002:aca:d907:: with SMTP id q7mr10884706oig.17.1617993076270; 
 Fri, 09 Apr 2021 11:31:16 -0700 (PDT)
Received: from minyard.net ([2001:470:b8f6:1b:485a:30a4:59bf:2a09])
 by smtp.gmail.com with ESMTPSA id m129sm659863oif.34.2021.04.09.11.31.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 11:31:15 -0700 (PDT)
Date: Fri, 9 Apr 2021 13:31:14 -0500
From: Corey Minyard <cminyard@mvista.com>
To: Patrick Venture <venture@google.com>
Subject: Re: [PATCH v2 0/4] hw/i2c: Adds pca954x i2c mux switch device
Message-ID: <20210409183114.GW7167@minyard.net>
References: <20210409162545.3705962-1-venture@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210409162545.3705962-1-venture@google.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=cminyard@mvista.com; helo=mail-oi1-x22e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: cminyard@mvista.com
Cc: wuhaotsh@google.com, qemu-arm@nongnu.org, hskinnemoen@google.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 09, 2021 at 09:25:41AM -0700, Patrick Venture wrote:
> The i2c mux device pca954x implements two devices:
>  - the pca9546 and pca9548.
> 
> v2:
>  - the core i2c bus now calls a match method on each i2c child, which
>  by default will only check for a match against itself.
>  - the pca954x device overrides the i2c device match method to search
>  the children for each of its buses that are active.
>  - the pca954x device now owns an i2c bus for each channel, allowing
>  the normal device model to attach devices to the channels.

I like this design.  Avoiding hacking into the bus code is a bonus.

Can these devices really have multiple channels enabled at the same
time?  That seems strange, but I guess that could be useful.

I'm not sure if you need to add a vmstate structure for this.  In
general most new devices have them; if it's ever included on an x86
system (or a system with vmstate transfer capability, probably more than
x86) that will become an issue.  I'm not sure what the expectations are,
though.

-corey

> 
> Patrick Venture (4):
>   hw/i2c: name I2CNode list in I2CBus
>   hw/i2c: add match method for device search
>   hw/i2c: move search to i2c_scan_bus method
>   hw/i2c: add pca954x i2c-mux switch
> 
>  MAINTAINERS                      |   6 +
>  hw/i2c/Kconfig                   |   4 +
>  hw/i2c/core.c                    |  55 ++++--
>  hw/i2c/i2c_mux_pca954x.c         | 290 +++++++++++++++++++++++++++++++
>  hw/i2c/meson.build               |   1 +
>  hw/i2c/trace-events              |   5 +
>  include/hw/i2c/i2c.h             |  16 +-
>  include/hw/i2c/i2c_mux_pca954x.h |  19 ++
>  8 files changed, 382 insertions(+), 14 deletions(-)
>  create mode 100644 hw/i2c/i2c_mux_pca954x.c
>  create mode 100644 include/hw/i2c/i2c_mux_pca954x.h
> 
> -- 
> 2.31.1.295.g9ea45b61b8-goog
> 

