Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EDD2FBFEF
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 20:29:50 +0100 (CET)
Received: from localhost ([::1]:51534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1whJ-0003LY-HJ
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 14:29:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1w54-0003Ig-L2
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:50:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1w52-0003Qm-WD
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:50:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611082216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sjXU4Pxsmc9lhddWsnrEDjtGyx8osuvgScBIWsPWhLc=;
 b=ALE9IWtnkFEwTDb79pJNY0Gt/5LsPHyQ2kq0xh4rPuMe317t+z92O/pvYgDDOqZCfyn9JV
 X9uzAUndEXCC2voxfhnTW73TQnIZqqCILD/IXG4kJQOwVUq74Ax9gIQi6K2GHU+7nWO5ab
 XuHjPP+e7NTyyhvMLqRopKP41aLUOTU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-131-B04f_8IUOdC-HSzuhBy0bg-1; Tue, 19 Jan 2021 13:50:14 -0500
X-MC-Unique: B04f_8IUOdC-HSzuhBy0bg-1
Received: by mail-ed1-f72.google.com with SMTP id a24so4568159eda.14
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 10:50:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sjXU4Pxsmc9lhddWsnrEDjtGyx8osuvgScBIWsPWhLc=;
 b=BB0tqCNXNs/sZ4SNFUUKQMQ3QrDKBhxvkS8AwBzR2SO0zYdo97Nt8lkj3polQwm4Ic
 YTtQpsIwwFNASneDcR67ZRfEg+eFNMvIJvL9vwxhnbS6AFt0Xp89aEBP7uHgYbtRDsbh
 wILiU67EsHc+LQe5jBf8aksFpqd6t206Y4NuWi41/CiDxWtEC+Jvt+g1E1D+nWhJdS8V
 hxIL9+UvI8N0w0HVraoDauXHzPfZGDxtQY8LCzKrE+MA+lxUxvmgD4kk8mVRTqPmgpoI
 QNBjSE4ImRXHk8Gs0WidZxFxM0o0kEi79V6DYJYjIU8RGZMaJWG4Miv3I3RrGOGDZrYK
 Ap9Q==
X-Gm-Message-State: AOAM5303LPSh3WVL6/UOJaAhW8rW4xmMtkrKd4zFbU32/raSyhuKI+tg
 lqq5aW9vN2Iem4oI/UwcpE/oKDOrU0fMcruw0Rs1bN5192GoJA5T6Q9ZGgTKq7xubtDAyTtKK3b
 5maqtIbAs+mkU3/cuYPWyaHFmsjUm25YAw5TlP5Yel8GT0TaSmJvwqy5dyQavlNYS
X-Received: by 2002:a17:906:3ce:: with SMTP id
 c14mr3983520eja.497.1611082213096; 
 Tue, 19 Jan 2021 10:50:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzsnx0a8GgQwIVzgaO1303hI8Hh6CaJ1y5BL/qiz2EKwCzJurOf+M/COko7IXvcMz7H668trg==
X-Received: by 2002:a17:906:3ce:: with SMTP id
 c14mr3983508eja.497.1611082212883; 
 Tue, 19 Jan 2021 10:50:12 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id u2sm9774074edp.12.2021.01.19.10.50.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 10:50:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/9] meson: Summarize generic information first
Date: Tue, 19 Jan 2021 19:49:57 +0100
Message-Id: <20210119185005.880322-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210119185005.880322-1-philmd@redhat.com>
References: <20210119185005.880322-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move generic summary information on top.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 meson.build | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meson.build b/meson.build
index 3d889857a09..ddac09ca159 100644
--- a/meson.build
+++ b/meson.build
@@ -2301,6 +2301,9 @@
 summary_info += {'Source path':       meson.current_source_dir()}
 summary_info += {'GIT binary':        config_host['GIT']}
 summary_info += {'GIT submodules':    config_host['GIT_SUBMODULES']}
+summary_info += {'Documentation':     build_docs}
+summary_info += {'Install blobs':     get_option('install_blobs')}
+
 summary_info += {'C compiler':        meson.get_compiler('c').cmd_array()[0]}
 summary_info += {'Host C compiler':   meson.get_compiler('c', native: true).cmd_array()[0]}
 if link_language == 'cpp'
@@ -2397,14 +2400,12 @@
   summary_info += {'xen ctrl version':  config_host['CONFIG_XEN_CTRL_INTERFACE_VERSION']}
 endif
 summary_info += {'brlapi support':    brlapi.found()}
-summary_info += {'Documentation':     build_docs}
 summary_info += {'PIE':               get_option('b_pie')}
 summary_info += {'vde support':       config_host.has_key('CONFIG_VDE')}
 summary_info += {'netmap support':    config_host.has_key('CONFIG_NETMAP')}
 summary_info += {'Linux AIO support': config_host.has_key('CONFIG_LINUX_AIO')}
 summary_info += {'Linux io_uring support': config_host.has_key('CONFIG_LINUX_IO_URING')}
 summary_info += {'ATTR/XATTR support': libattr.found()}
-summary_info += {'Install blobs':     get_option('install_blobs')}
 summary_info += {'KVM support':       config_all.has_key('CONFIG_KVM')}
 summary_info += {'HAX support':       config_all.has_key('CONFIG_HAX')}
 summary_info += {'HVF support':       config_all.has_key('CONFIG_HVF')}
-- 
2.26.2


