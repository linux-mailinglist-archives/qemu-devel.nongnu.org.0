Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2382741269A
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 21:06:20 +0200 (CEST)
Received: from localhost ([::1]:56652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSOcN-0007IT-2R
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 15:06:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mSOZj-0005RN-1o
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 15:03:36 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:35788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mSOZg-0002zt-BZ
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 15:03:34 -0400
Received: by mail-ed1-x52e.google.com with SMTP id v5so64031990edc.2
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 12:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1DWHDoOZ/pbRf8Jo1bNxhSninS64+4peeNbndFDqnEo=;
 b=asZ0q51fLsEarSICw3dcqvjB4gYmDVwjyVAIhzDMBiiQq2wEj50K0sOvuK/fwvIRhk
 sYjNC/nwBKCIFQNKWZv19TcTHQvjrKyINMVY/VNx1+/AxqYR0ixoiZra0A37mYDXom+T
 4NwAYF7rsPZv1TJPEXgVLOTvfGKpbgmBNRWDiXM8o+ABVIBI+z8z7hme/0NGXOrxUJeo
 Tg5CWjkAk/wldrjRIF3qCSTG3t+bBlFmtDiJOBMkiDucFNO1ZOWPolxNAqdwOnMRolCw
 f8Y1iEMm+vZ0dFHylG+52S24U6lTr6dor64njw60fAvx+YYbxVJZAA3kH7lFyRHE5a2S
 bqug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1DWHDoOZ/pbRf8Jo1bNxhSninS64+4peeNbndFDqnEo=;
 b=toQEa9qbDANnFEhn0Cg/eMPl7wB7vhVhwu/RArs2uhTgMxh0RKPk0aD4kuoTce4m90
 xboCgVoEZXQmAO4wfkDW7d6Sf/AXCkCUVto+DjdAUvt84UeezQdbEIE4WmQVbk2pIPau
 zMbZQd/JncJ/3oLrVXozy6QzXS8U4XD2nrc06w2t6my+oj8dI7fvCLj14fx5nXFNtZG+
 PYxU6JOA9/TlG00Mp4oEHWikapxqEyOzAh6pO9D0nwTuSTTMQ3kHtU3n3WtjnNj1V5XA
 aXVxhSkR2SicJhZAoecOVGHlRyznd1/BfFMJUxtfNoiObOBxcX/bG0aPHJVRVCRfiZNl
 dzWQ==
X-Gm-Message-State: AOAM531o4FOssNQFRV+qx0OhFK3NZlP/V+POVeNLpAUTJWK0tukHUxfZ
 maGEqwOt8P73BQ972u9aK/oE2mFFEds=
X-Google-Smtp-Source: ABdhPJzFRM9VHemnshKsXOK1eSKehPMYAiceHclEAWwNsREu6z1YBeGq6M+9OPviQ5BW1TDwdJTQAQ==
X-Received: by 2002:a50:d713:: with SMTP id t19mr30742714edi.2.1632164609923; 
 Mon, 20 Sep 2021 12:03:29 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id b3sm6425892ejb.7.2021.09.20.12.03.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 12:03:29 -0700 (PDT)
Subject: Re: [PATCH 1/2] meson: introduce modules_arch
To: "Jose R. Ziviani" <jziviani@suse.de>, Gerd Hoffmann <kraxel@redhat.com>
References: <20210917012904.26544-1-jziviani@suse.de>
 <20210917012904.26544-2-jziviani@suse.de>
 <20210917071404.efhv3tlnad2ezz3e@sirius.home.kraxel.org>
 <YUSS0Jp+GBwNwYg3@pizza>
 <20210920051532.tzanl2asdqzuxlzn@sirius.home.kraxel.org>
 <YUiGcjBviIqPIyJB@pizza>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <05b09438-43ef-bd40-2b0a-2fdebf0425bd@redhat.com>
Date: Mon, 20 Sep 2021 21:03:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YUiGcjBviIqPIyJB@pizza>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/09/21 15:02, Jose R. Ziviani wrote:
> But, in anyway, I'll still need to store the target architecture that
> can use such core module, like I did here in this patch. Otherwise,
> if I compile different targets at the same time, I'll end up with the
> same problem of targets trying to load wrong modules.
> 
> I thought of using qom, but I think it will pollute module.c.

Alternatively, you could C-ify the contents of config-devices.mak, and 
embed them in the per-arch modinfo-*.c; and record CONFIG_* symbols for 
each module (e.g. '{ "CONFIG_QXL", "hw-display-qxl" }' from a 
'module_config("CONFIG_QXL")' line in the global modinfo.c file.  Then 
before loading a module you do a binary search on the per-arch 
config-devices array.

I hope the above is readable. :)

Paolo

