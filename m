Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC51D2B1D07
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 15:18:47 +0100 (CET)
Received: from localhost ([::1]:43300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdZuY-0000Uz-W3
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 09:18:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kdZsR-0007nN-UK
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 09:16:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kdZsP-0006cu-0O
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 09:16:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605276991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IBSrv20qPmmQxWRHtLqZmsbRw6UXoKK7PhhdC6ebPgA=;
 b=HzAbXePOVl3zLAb/3SOgC1h3mPH9tttB1tdDLlUDDi+fLJ6uIXMmfXw8WcpvVk9i/L4Pnz
 h1g4zFYO4g1VLm4F8+HZHx+iswtDXU34kuuUuXB16lUeBm/WSDLBz4PNa6ctDDp9pJwLU7
 TKtq3yUUqlaJuQdRujbeZ/rs/5H1KTU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-iKHAQ9IaNI6aAFnoetz3AA-1; Fri, 13 Nov 2020 09:16:29 -0500
X-MC-Unique: iKHAQ9IaNI6aAFnoetz3AA-1
Received: by mail-wm1-f69.google.com with SMTP id 14so4029276wmg.1
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 06:16:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IBSrv20qPmmQxWRHtLqZmsbRw6UXoKK7PhhdC6ebPgA=;
 b=qB6vEhCVV2hJPZev1a7wiTNt8GED54Apr/hVhiUqjV3RA8X5LfSDzm4salvZE0n4Cy
 s8aQkOfLW6bdwDfBLsWotbCri2GJsO+WV3MyGdGpePEV9kpPNttSgGCZC+0DB2yrCuOP
 XNbRHVX3WF3wncMR594ru20XfDAJuwhuyDdTOA8PtLbv3Hyih4gI/vELfjTCmKhaWpoZ
 ZNwQrWQcHm3eD5mAWdLbCK5AiVKOGZACckeRXjMYSIz40AxZe7KxAcbObpnNv/LU28VX
 jNg0Z80YXIGGhqzgrPgz5Ujw/xkOedul/VPqN2DcLd4y/yGGJf//v+rq5LVGzt+k6R6F
 T0+A==
X-Gm-Message-State: AOAM533IzggYUk1CnLOoKekxBvxvW3vEquafDoB30ebD3eTe6AsSQ7J8
 s+Ob9xFHRyiX9QyDjluq0w1PmcCSdt1MFWnSvrEss/19V0TFQbtGazzSCqPV8n8KcXcTg+bEV/z
 y0sFdIv3Jk82M17s=
X-Received: by 2002:adf:e484:: with SMTP id i4mr3859384wrm.398.1605276988247; 
 Fri, 13 Nov 2020 06:16:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJycEwRe2FK57Srf9vWkzolYeM6cLI5OXYzBOOfp4ChjDsJbheNZ0hL79jKSr4Q3yFSLPiWtmA==
X-Received: by 2002:adf:e484:: with SMTP id i4mr3859361wrm.398.1605276988060; 
 Fri, 13 Nov 2020 06:16:28 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k84sm10436515wmf.42.2020.11.13.06.16.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2020 06:16:26 -0800 (PST)
To: Kevin Wolf <kwolf@redhat.com>
References: <20201112175905.404472-1-kwolf@redhat.com>
 <20201112175905.404472-9-kwolf@redhat.com>
 <f2f96454-5cbf-ae74-25dc-4d509a88faf4@redhat.com>
 <20201113132021.GE5834@merkur.fritz.box>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 08/13] char: Add mux option to ChardevOptions
Message-ID: <206bba9d-099b-da4d-5de0-b938a372659c@redhat.com>
Date: Fri, 13 Nov 2020 15:16:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201113132021.GE5834@merkur.fritz.box>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: marcandre.lureau@redhat.com, qemu-devel@nongnu.org, dgilbert@redhat.com,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/11/20 14:20, Kevin Wolf wrote:
>> 	-object chardev-stdio,id=stdio
>> 	-object chardev-mux-controller,id=mux,backend=stdio
>> 	-object chardev-mux,id=serial-chardev,controller=mux
>> 	-object chardev-mux,id=mon-chardev,controller=mux
>> 	-serial chardev:serial-chardev
>> 	-monitor chardev:mon-chardev
> I don't think these "mux" chardevs plugged to a "mux-controller"
> actually exist, at least today. You can directly plug serial and monitor
> to a mux chardev that sits on top of stdio.

Yes, you're right.  There's 2 CharBackends plugged into a single mux 
Chardev.

> This is basically what I meant when I said your QOM conversion and my
> QAPIfication work aren't conflicting (conceptually), but addressing
> separate problems.

Fair enough, I think I understand what you mean now.  And I can't really 
argue with the diffstat and the usage of aliases to clean up dash vs. 
underscores.

Paolo


