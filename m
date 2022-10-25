Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AC260CC41
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 14:44:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onJGE-0004Zk-BN; Tue, 25 Oct 2022 08:42:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1onJG9-0004Ci-WD
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 08:42:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1onJG7-0002nM-4D
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 08:42:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666701737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0UtVZv8BhP33EMBwYQNFc9v/3YBi15vC8S7M37GRYRg=;
 b=DvKA72ChOOtWBqYjXBCyvnHkjemFxCai2lpB4Pki6hFDtcDA3mDQQ6VTF9+Z2/lJUlyJfD
 N2Z14aHBRaY3T48jMXVcCvo2YusZ4gGNZ62VkpEdHMCpRatgsqgLHcbsuvxLUbZbRLJDwP
 zIaZDWAIyeweGGlFKJUpl/GgWL5aqpY=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-265-DogebTscP-mKDTMiKnIW0A-1; Tue, 25 Oct 2022 08:42:15 -0400
X-MC-Unique: DogebTscP-mKDTMiKnIW0A-1
Received: by mail-qk1-f200.google.com with SMTP id
 w13-20020a05620a424d00b006e833c4fb0dso11282354qko.2
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 05:42:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0UtVZv8BhP33EMBwYQNFc9v/3YBi15vC8S7M37GRYRg=;
 b=PpY+CjVpnD4tZoM3UQ2ZIilESFPuS5o0UQIQlV8hBIykMEDQ5i6p3KnE5tuQmrW1ED
 hhR6MLFcKFyObVloIdZOk/053suhwOKNZeCNOyciEUSVGv9vJVj6/NZz5u2Va6BZBTN3
 N5Yq6IQBd5RCiHJaXth5/JaSOaAmeOOXC1IDgudGyCWgBG/qiFvzvQv7hbPeloXBBryx
 /+LGFJpqknF6naM24iOhCWaiQ5aX96t5r7FbJcNdH7FvGXWPbz/EMbJ8XA5ZT8AuVopW
 0xr5NsxPuMlOsiGfQP2VwAK38fYF1hiA9THyb4tXSdZ3P9+rr3omK6cYsQNnBYiU/cgH
 YkVQ==
X-Gm-Message-State: ACrzQf0sUsN6P8R2hiTp1zSbIFWKx6b93DgFeo7wOaBKu2Ty9v3VoEyi
 nA8B0yoplemJqZ/seInFyavIC1gcbz1V1176pU+ow/UBjTvx6pelOs9V8ozCgI65b9atGD4D14x
 B+NyS7tjvmeY7stQ=
X-Received: by 2002:a05:622a:1648:b0:39c:b953:d1b8 with SMTP id
 y8-20020a05622a164800b0039cb953d1b8mr31623915qtj.506.1666701735045; 
 Tue, 25 Oct 2022 05:42:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4U3xrTOD5eOZ3w1zIVVqc9Rogy1Z0idxGM2Zp2qzWrjjXwQ/XoCRyBfiS1nuKacMlx+0zN0Q==
X-Received: by 2002:a05:622a:1648:b0:39c:b953:d1b8 with SMTP id
 y8-20020a05622a164800b0039cb953d1b8mr31623885qtj.506.1666701734760; 
 Tue, 25 Oct 2022 05:42:14 -0700 (PDT)
Received: from [10.201.49.36] (nat-pool-mxp-u.redhat.com. [149.6.153.187])
 by smtp.googlemail.com with ESMTPSA id
 bi24-20020a05620a319800b006eeca296c00sm2014713qkb.104.2022.10.25.05.42.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Oct 2022 05:42:13 -0700 (PDT)
Message-ID: <c60fa9e2-b5c4-6765-da23-e6cc31746f53@redhat.com>
Date: Tue, 25 Oct 2022 14:42:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v4 1/1] os-posix: asynchronous teardown for shutdown on
 Linux
Content-Language: en-US
To: Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: qemu-devel@nongnu.org, david@redhat.com, cohuck@redhat.com,
 thuth@redhat.com, borntraeger@de.ibm.com, frankja@linux.ibm.com,
 fiuczy@linux.ibm.com, pasic@linux.ibm.com, berrange@redhat.com,
 alex.bennee@linaro.org, armbru@redhat.com,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
References: <20220812133453.82671-1-imbrenda@linux.ibm.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220812133453.82671-1-imbrenda@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 8/12/22 15:34, Claudio Imbrenda wrote:
> This patch adds support for asynchronously tearing down a VM on Linux.
> 
> When qemu terminates, either naturally or because of a fatal signal,
> the VM is torn down. If the VM is huge, it can take a considerable
> amount of time for it to be cleaned up. In case of a protected VM, it
> might take even longer than a non-protected VM (this is the case on
> s390x, for example).
> 
> Some users might want to shut down a VM and restart it immediately,
> without having to wait. This is especially true if management
> infrastructure like libvirt is used.
> 
> This patch implements a simple trick on Linux to allow qemu to return
> immediately, with the teardown of the VM being performed
> asynchronously.
> 
> If the new commandline option -async-teardown is used, a new process is
> spawned from qemu at startup, using the clone syscall, in such way that
> it will share its address space with qemu.The new process will have the
> name "cleanup/<QEMU_PID>". It will wait until qemu terminates
> completely, and then it will exit itself.
> 
> This allows qemu to terminate quickly, without having to wait for the
> whole address space to be torn down. The cleanup process will exit
> after qemu, so it will be the last user of the address space, and
> therefore it will take care of the actual teardown. The cleanup
> process will share the same cgroups as qemu, so both memory usage and
> cpu time will be accounted properly.
> 
> If possible, close_range will be used in the cleanup process to close
> all open file descriptors. If it is not available or if it fails, /proc
> will be used to determine which file descriptors to close.
> 
> If the cleanup process is forcefully killed with SIGKILL before the
> main qemu process has terminated completely, the mechanism is defeated
> and the teardown will not be asynchronous.
> 
> This feature can already be used with libvirt by adding the following
> to the XML domain definition to pass the parameter to qemu directly:
> 
>    <commandline xmlns="http://libvirt.org/schemas/domain/qemu/1.0">
>    <arg value='-async-teardown'/>
>    </commandline>
> 
> Signed-off-by: Claudio Imbrenda<imbrenda@linux.ibm.com>
> Reviewed-by: Murilo Opsfelder Araujo<muriloo@linux.ibm.com>
> Tested-by: Murilo Opsfelder Araujo<muriloo@linux.ibm.com>
> ---

Nice trick indeed!

The only question I have is whether it would make sense to do this in 
Libvirt instead.

Having a new independent one-off option like this is not great, but I 
think it's fine because it's not a very reusable grouping.

Paolo


