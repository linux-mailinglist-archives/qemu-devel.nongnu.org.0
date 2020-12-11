Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B18032D829A
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 00:08:57 +0100 (CET)
Received: from localhost ([::1]:54052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knrWy-0005cf-Q5
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 18:08:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1knqpU-0006cs-57
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 17:24:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1knqpP-0003Wf-NC
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 17:23:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607725432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9AcOEdH7NZ/ihKr9klY1G7kbtQ2a+AzjiCFjvQ2RquI=;
 b=Xux9NyjooU5Z933GaC+gXXpIXXNTdgjq4Omnu2xIodigCjK9dwodEAUo2yOisPgMVKfMdT
 1GNyaemo5dvWtSV5kyi5At1wJEZ8jVsquzCeYmMurXDXMZsjDJUiGBVVVeMmt3+ZvpN8zn
 Ze9mWQBRc0+04ujMnfG2yfICbF9tD7s=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-xbQDDeGZNm22331rPSj5pg-1; Fri, 11 Dec 2020 17:23:51 -0500
X-MC-Unique: xbQDDeGZNm22331rPSj5pg-1
Received: by mail-wr1-f70.google.com with SMTP id q18so3847218wrc.20
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 14:23:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9AcOEdH7NZ/ihKr9klY1G7kbtQ2a+AzjiCFjvQ2RquI=;
 b=ilKv7KsnupheVQbn8bx56qDNVTpO8QrZ/BtVi+YUsBxGRjd7A8I34D/T/rr+i1Lh/x
 /F2bSDZ8KPalDgdvHDCy5Wj+IbMmrwVZfBV089qvR6mEu04EYUlHbK/cC2dlu2Nh93i3
 475HuWbnQEokrJLutZl0KLtNI4kRlOywSppMtTYUzdFyP8okFeOwOcwERUPinTtXY3zx
 +Gi+O752J2pd88jUSpt3ndPJ40lOJ9LfmN2Miw8p3rwjmfzwQB59bDqYvwsIkkc3/M0K
 iZezy0IQZtUbGsDgcOQkr/FeJ6boTFPpmrtQtl5LeCrE+xL12HoB2SeoZirm8GVSH2rM
 3GpQ==
X-Gm-Message-State: AOAM532dKD/4B1J3FkdoMTKm6qLJy3ifbAdgYUrljXIq8S8TsVdH/uUo
 lQORNLVtEAWGWyIKtuYlNFzlvhIJ3A6Hlz5dffpT3D3s3W+53nVlOnuVf2MnmNHmwW0p2jxmmYG
 FdGaHz/VcLrAmAe0=
X-Received: by 2002:adf:e547:: with SMTP id z7mr15749530wrm.283.1607725428948; 
 Fri, 11 Dec 2020 14:23:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw2Y6ib+ozPqb2yNcpudXDr94N7QEhjbLdfev3WeNBxKAGMK4tUjUt2STlVCoX2rZDyqubg0w==
X-Received: by 2002:adf:e547:: with SMTP id z7mr15749516wrm.283.1607725428711; 
 Fri, 11 Dec 2020 14:23:48 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id d3sm17515494wmb.5.2020.12.11.14.23.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Dec 2020 14:23:47 -0800 (PST)
Subject: Re: [PATCH v3 0/4] Add a new -action parameter
To: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>, qemu-devel@nongnu.org
References: <1607705564-26264-1-git-send-email-alejandro.j.jimenez@oracle.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <2bbf703d-2f41-c6a9-9051-b06fb666a77d@redhat.com>
Date: Fri, 11 Dec 2020 23:23:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1607705564-26264-1-git-send-email-alejandro.j.jimenez@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: david.edmondson@oracle.com, mihai.carabas@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/12/20 17:52, Alejandro Jimenez wrote:
> This is a follow up to the proposal to add a "-no-panicstop" option to QEMU that would allow us to
> control whether the VM is paused or allowed to continue running without intervention from a management layer
> when a guest panic occurs. See the inital thread and replies for details:
> 
> https://lore.kernel.org/qemu-devel/1601606494-1154-1-git-send-email-alejandro.j.jimenez@oracle.com/
> 
>  From that discussion came a request for a generic mechanism to group options like -no-shutdown, -no-reboot, etc,
> that specify an action taken by QEMU in response to a guest event (reboot, shutdown, panic, and watchdog
> expiration are the current options). The existing options would translate to the new option, like:
> 
> * -no-reboot --> "-action reboot=shutdown"
> * -no-shutdown --> "-action shutdown=pause"
> 
> Please share any questions or comments.

Thanks, this looks good.

(Actually there are a bunch of changes needed for other patches that I 
have queued, but I can take care of that.  Basically, I am moving 
command line parsing from softmmu/runstate-action.c to softmmu/vl.c 
because we're trying to move all command line stuff there + in turn make 
vl.c use QMP commands as much as possible).

Paolo


