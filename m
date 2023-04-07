Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC896DAB0F
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Apr 2023 11:48:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkifs-0007td-5g; Fri, 07 Apr 2023 05:46:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pkifp-0007tM-T8
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 05:46:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pkifn-0001nL-VX
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 05:46:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680860782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EQKnJJ3Rpbr6EsD/GpLyyCEHkqO9Y49aHWPvBtTrM8g=;
 b=P0BRDxvGr9/xkh/semc8xbnliCOG9eXQl3bOMyFRurXzn8zOe+FfkmRksVHsL2bBsPBxSJ
 gFDCGanZiNmXdKmY/yINn5eAgWZKi9TE3bh8zsScQE+bZRM+HShT2uby6FJL2LOFz7MccC
 5dTFi4wI/wH/NFPB8ca7Gpe5KUuiWls=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-463-pzeztH2EMzm2lQSnOCfBXA-1; Fri, 07 Apr 2023 05:46:18 -0400
X-MC-Unique: pzeztH2EMzm2lQSnOCfBXA-1
Received: by mail-wm1-f70.google.com with SMTP id
 bg33-20020a05600c3ca100b003ef6d684105so16972391wmb.1
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 02:46:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680860777;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EQKnJJ3Rpbr6EsD/GpLyyCEHkqO9Y49aHWPvBtTrM8g=;
 b=UEWwIHmYgPKD8+2VXiZUKjWI368BWXtQEd3CHjT/UCrAJNl3TcrQiybUFZy1MEamK4
 NY5ZExvRzsonvH7Z5Y/KEDaHgM4jPby9PXatbhIP74TWXm843BtvVu4rGt4TEpde9oer
 xLEUutJ1OMJZWvqi49UTgaHJww5kIZuy1+XBEAJ6j6PXzAedSg+GdKiHich9nLf4q4B6
 4GGB6Hx6sP4U8Quy9nUkkXswBBZZquOZMaZICLLJGyZBuwqapb1VGWoDgnpcuJPfWz6H
 0Lr6xZpVCfBqmXTG2+psOOOHXrq3RUZzGPz2Q/GtfqyEn0kUWzKHNNnEnR9BKB5oplyX
 XWlQ==
X-Gm-Message-State: AAQBX9cPnH3lNjzM6BApAjJTp+UWxMncWPw7y1sK44kb4JQ+SQNzFwCu
 0twA72Q32bjmRpypD86yP4Yq1mVkF8mpQ4BN7kiqZzE3M5K3MJa9u5RDvV/598oGmj8gwTe13tn
 v0jKLqGYEQdWIc+M=
X-Received: by 2002:a5d:638f:0:b0:2d1:e517:4992 with SMTP id
 p15-20020a5d638f000000b002d1e5174992mr943217wru.69.1680860777841; 
 Fri, 07 Apr 2023 02:46:17 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZiMCRGPhJakMQ1VdPotOCTKha8s0ilnLSebY1tnk7biuAZZEx42kaTLEWIkq9TaRPLerX4hg==
X-Received: by 2002:a5d:638f:0:b0:2d1:e517:4992 with SMTP id
 p15-20020a5d638f000000b002d1e5174992mr943212wru.69.1680860777579; 
 Fri, 07 Apr 2023 02:46:17 -0700 (PDT)
Received: from redhat.com ([2a06:c701:742d:fd00:c847:221d:9254:f7ce])
 by smtp.gmail.com with ESMTPSA id
 t2-20020a5d49c2000000b002cfed482e9asm4118457wrs.61.2023.04.07.02.46.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 02:46:16 -0700 (PDT)
Date: Fri, 7 Apr 2023 05:46:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Turner <digit@google.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH 1/3] Fix libvhost-user.c compilation.
Message-ID: <20230407054455-mutt-send-email-mst@kernel.org>
References: <20230405172109.3081788-1-digit@google.com>
 <20230405172109.3081788-2-digit@google.com>
 <20230407035709-mutt-send-email-mst@kernel.org>
 <CACnJMqpF9FPwtZz3Uj_amCbrRtQo7WWPm0bY_qy=80+ihb8Uhw@mail.gmail.com>
 <CACnJMqoS3L6=zTCL4__EwOk8pR0kR4P2Kbrv5U_xB8Lm2e=vXQ@mail.gmail.com>
 <CACnJMqp_+8W74_xbfkiAcR5_o6kgmyz46gkiroccNMye9ubdUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACnJMqp_+8W74_xbfkiAcR5_o6kgmyz46gkiroccNMye9ubdUw@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Fri, Apr 07, 2023 at 11:29:46AM +0200, David Turner wrote:
> So it looks like that for some reason, the QEMU linux-headers directory is not
> in the include search path for this compilation command, and that the
> system-or-sysroot provided <linux/vhost.h> is picked instead. Fixing this might
> be a better long-term fix than what I am proposing in this patch. I am not sure
> how to do that yet though. Do you have any recommendations?

Check what flags are passed to the compiler :)
meson.build has:

if targetos == 'linux'
  add_project_arguments('-isystem', meson.current_source_dir() / 'linux-headers',
                        '-isystem', 'linux-headers',
                        language: all_languages)
endif


-- 
MST


