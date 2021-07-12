Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1F23C63B7
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 21:27:24 +0200 (CEST)
Received: from localhost ([::1]:33406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m31aN-0002sI-Jw
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 15:27:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1m31Yc-0001rC-OO
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 15:25:34 -0400
Received: from mailout02.t-online.de ([194.25.134.17]:33192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1m31Ya-0006pT-B3
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 15:25:34 -0400
Received: from fwd25.aul.t-online.de (fwd25.aul.t-online.de [172.20.26.130])
 by mailout02.t-online.de (Postfix) with SMTP id 9F675457C;
 Mon, 12 Jul 2021 21:24:21 +0200 (CEST)
Received: from [192.168.211.200]
 (TvXbxUZXYh01SWlcp87HHMooQnwtY9+qTpfzIeT2AVD+PLmiWtOws0QqXs7H-bFQOp@[93.236.158.58])
 by fwd25.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1m31XO-03p29o0; Mon, 12 Jul 2021 21:24:18 +0200
Subject: Re: [PULL 36/40] vl: switch -M parsing to keyval
To: Paolo Bonzini <pbonzini@redhat.com>
References: <20210706100141.303960-1-pbonzini@redhat.com>
 <20210706100141.303960-37-pbonzini@redhat.com>
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Message-ID: <70167748-4d64-b481-36de-67ee8ed684db@t-online.de>
Date: Mon, 12 Jul 2021 21:24:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706100141.303960-37-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ID: TvXbxUZXYh01SWlcp87HHMooQnwtY9+qTpfzIeT2AVD+PLmiWtOws0QqXs7H-bFQOp
X-TOI-EXPURGATEID: 150726::1626117858-0000AC82-00A6E9CA/0/0 CLEAN NORMAL
X-TOI-MSGID: 80c18d20-9de0-4ef1-a7cb-8f3306b60311
Received-SPF: none client-ip=194.25.134.17; envelope-from=vr_qemu@t-online.de;
 helo=mailout02.t-online.de
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-1.479, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

> Switch from QemuOpts to keyval.  This enables the introduction
> of non-scalar machine properties, and JSON syntax in the future.
>
> For JSON syntax to be supported right now, we would have to
> consider what would happen if string-based dictionaries (produced by
> -M key=val) were to be merged with strongly-typed dictionaries
> (produced by -M {'key': 123}).
>
> The simplest way out is to never enter the situation, and only allow one
> -M option when JSON syntax is in use.  However, we want options such as
> -smp to become syntactic sugar for -M, and this is a problem; as soon
> as -smp becomes a shortcut for -M, QEMU would forbid using -M '{....}'
> together with -smp.  Therefore, allowing JSON syntax right now for -M
> would be a forward-compatibility nightmare and it would be impossible
> anyway to introduce -M incrementally in tools.
>
> Instead, support for JSON syntax is delayed until after the main
> options are converted to QOM compound properties.  These include -boot,
> -acpitable, -smbios, -m, -semihosting-config, -rtc and -fw_cfg.  Once JSON
> syntax is introduced, these options will _also_ be forbidden together
> with -M '{...}'.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   softmmu/vl.c | 315 ++++++++++++++++++++++++---------------------------
>   1 file changed, 146 insertions(+), 169 deletions(-)
>
>

Since this commit QEMU fails to start on my system.

./qemu-system-i386 -machine pc,pcspk-audiodev=audio0 -audiodev pa,id=audio0
qemu-system-i386: Parameter 'audiodev' is missing

With best regards,
Volker

