Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFA1406105
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 02:29:45 +0200 (CEST)
Received: from localhost ([::1]:44492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOUQI-0001em-QQ
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 20:29:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1mOUNd-0000Fw-5T; Thu, 09 Sep 2021 20:26:57 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:37866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1mOUNZ-0006qG-Ji; Thu, 09 Sep 2021 20:26:56 -0400
Received: by mail-ot1-x331.google.com with SMTP id
 i3-20020a056830210300b0051af5666070so11933otc.4; 
 Thu, 09 Sep 2021 17:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=VkIEr3Njmcz4EbRtLtUxlzuXjygP3WYbEHnfNYubhGI=;
 b=GgUEaMLYa3ISXYMJ2xc4bJMhyj1c7Vy2Fq29ieg/iQC6sRLZ8Zfe+hRsAApWvZH2Ad
 xJf3VlSOyCLSH8tN7sWzKSbHuj+BrCYpnzjPxxgzB7sVFgNlyumkumc6ijCEysUVzFuc
 OaEQNEY4r2jvclFrGxOnL7AF5p4KiCDnlmW4mMhwODCFfu9eez+/aX1IpfIEeZwASOi6
 NmitZAwSXj5e2L8D+k+U9bSSGwvNA3BfI1/t111DEmB+m7uyWN8zu2LevEyf6hbLryJX
 ymttqoFBBHSLE003sBG/cufP6czTWM3F7bCk1to2B6aZRy5CdaQBr1+ybOK/9GMb/U9q
 V1fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to;
 bh=VkIEr3Njmcz4EbRtLtUxlzuXjygP3WYbEHnfNYubhGI=;
 b=ZEEh8CwdkGxAveXGWzvHMjsCzwIJQzrSy06BhOqFyEYv0ruzEPuhOasU9uvxPpI0BZ
 QEdHUK9ey+DYwEx8fGZ/Yj+6Nyw4f+1R6kGvJaiwG+MPN4eMZnb9/CwBcRi5W/SWBsqw
 qu3WXxFL932Uqg92blukhzHCoKY13V5Ms7PWMFSbTCLZ1hTs95B3ZSW0okEZSZfmA6fc
 ME0b4avQgZmVFZHQeM5fc1qhDfV1F+VEuporFVOIk4MrYQpXS6cctKvhwhK/Y4mQ58Co
 isVA0SSFqyWQDb/tUIeRjIomsHmGaRYJKNspVa4YawKMHW+qQFo3yGo+9vQ/W9D57N3l
 qudQ==
X-Gm-Message-State: AOAM532TSk9R3vH5ASpiAwsJSMTfF8DZyjERYns44R8WnaBn86T9mxm5
 za3tCS4LTyAKTlMPpKnavw==
X-Google-Smtp-Source: ABdhPJwKn/ZwSEjovzfyD64EOX3FdBchLDMh29wNLoCkVHjFkV2pNxiYxnMQ+1h/6ldMt+If3i1ZLg==
X-Received: by 2002:a05:6830:4191:: with SMTP id
 r17mr2266999otu.146.1631233611590; 
 Thu, 09 Sep 2021 17:26:51 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id a13sm795791oos.4.2021.09.09.17.26.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 17:26:50 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:c5ab:34b3:4e95:9c80])
 by serve.minyard.net (Postfix) with ESMTPSA id 9FD611800ED;
 Fri, 10 Sep 2021 00:26:49 +0000 (UTC)
Date: Thu, 9 Sep 2021 19:26:48 -0500
From: Corey Minyard <minyard@acm.org>
To: Hao Wu <wuhaotsh@google.com>
Subject: Re: [PATCH 4/8] hw/ipmi: Refactor IPMI interface
Message-ID: <20210910002648.GP545073@minyard.net>
References: <20210909230620.511815-1-wuhaotsh@google.com>
 <20210909230620.511815-5-wuhaotsh@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210909230620.511815-5-wuhaotsh@google.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=tcminyard@gmail.com; helo=mail-ot1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Reply-To: minyard@acm.org
Cc: peter.maydell@linaro.org, titusr@google.com, venture@google.com,
 hskinnemoen@google.com, qemu-devel@nongnu.org, kfting@nuvoton.com,
 qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 09, 2021 at 04:06:16PM -0700, Hao Wu wrote:
> This patch refactors the IPMI interface so that it can be used by both
> the BMC side and core-side simulation.
> 
> Detail changes:
> (1) rename handle_rsp -> handle_msg so the name fits both BMC side and
>     Core side.
> (2) Add a new class IPMICore. This class represents a simulator/external
>     connection for both BMC and Core side emulation. The old IPMIBmc is
>     a sub-class of IPMICore.
> (3) Change all ibe->parent.intf in hw/ipmi/ipmi_bmc_*.c to use type
>     cast to IPMICore. Directly accessing parent QOM is against QEMU
>     guide and by using type casting the code can fit both core side and
>     BMC side emulation.

I think I'm ok with this.  It fixes some fundamental issues (maybe that
should be separate patches, but I think it's ok here).

I was kind of against this at first, I was thinking a completely
separate code for the BMC-side hardware emulation.  But I can see that
so much code would be duplicated that it would be silly.

It would be better if there was an ipmi_bmc.[ch] that had the
BMC-specific things, split out from the ipmi.[ch] code.  I'm not 100%
sure how important that is, but it would be less confusing.  Do you
agree?

A couple of comments inline...

-corey

> 
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> ---
>  hw/ipmi/ipmi.c            | 15 +++++++++++---
>  hw/ipmi/ipmi_bmc_extern.c | 37 +++++++++++++++++++++--------------
>  hw/ipmi/ipmi_bmc_sim.c    | 41 ++++++++++++++++++++++++++-------------
>  hw/ipmi/ipmi_bt.c         |  2 +-
>  hw/ipmi/ipmi_kcs.c        |  2 +-
>  hw/ipmi/isa_ipmi_bt.c     |  4 +++-
>  hw/ipmi/isa_ipmi_kcs.c    |  4 +++-
>  hw/ipmi/pci_ipmi_bt.c     |  4 +++-
>  hw/ipmi/pci_ipmi_kcs.c    |  4 +++-
>  hw/ipmi/smbus_ipmi.c      |  6 ++++--
>  include/hw/ipmi/ipmi.h    | 40 ++++++++++++++++++++++++++++++--------
>  11 files changed, 111 insertions(+), 48 deletions(-)
> 
> diff --git a/hw/ipmi/ipmi.c b/hw/ipmi/ipmi.c
> index 8d35c9fdd6..7da1b36fab 100644
> --- a/hw/ipmi/ipmi.c
> +++ b/hw/ipmi/ipmi.c
> @@ -92,13 +92,21 @@ static TypeInfo ipmi_interface_type_info = {
>      .class_init = ipmi_interface_class_init,
>  };
>  
> +static TypeInfo ipmi_core_type_info = {
> +    .name = TYPE_IPMI_CORE,
> +    .parent = TYPE_DEVICE,
> +    .instance_size = sizeof(IPMICore),
> +    .abstract = true,
> +};
> +
>  static void isa_ipmi_bmc_check(const Object *obj, const char *name,
>                                 Object *val, Error **errp)
>  {
> -    IPMIBmc *bmc = IPMI_BMC(val);
> +    IPMICore *ic = IPMI_CORE(val);
>  
> -    if (bmc->intf)
> +    if (ic->intf) {
>          error_setg(errp, "BMC object is already in use");
> +    }
>  }
>  
>  void ipmi_bmc_find_and_link(Object *obj, Object **bmc)
> @@ -122,7 +130,7 @@ static void bmc_class_init(ObjectClass *oc, void *data)
>  
>  static TypeInfo ipmi_bmc_type_info = {
>      .name = TYPE_IPMI_BMC,
> -    .parent = TYPE_DEVICE,
> +    .parent = TYPE_IPMI_CORE,
>      .instance_size = sizeof(IPMIBmc),
>      .abstract = true,
>      .class_size = sizeof(IPMIBmcClass),
> @@ -132,6 +140,7 @@ static TypeInfo ipmi_bmc_type_info = {
>  static void ipmi_register_types(void)
>  {
>      type_register_static(&ipmi_interface_type_info);
> +    type_register_static(&ipmi_core_type_info);
>      type_register_static(&ipmi_bmc_type_info);
>  }
>  
> diff --git a/hw/ipmi/ipmi_bmc_extern.c b/hw/ipmi/ipmi_bmc_extern.c
> index acf2bab35f..a0c3a40e7c 100644
> --- a/hw/ipmi/ipmi_bmc_extern.c
> +++ b/hw/ipmi/ipmi_bmc_extern.c
> @@ -147,8 +147,9 @@ static void continue_send(IPMIBmcExtern *ibe)
>  
>  static void extern_timeout(void *opaque)
>  {
> +    IPMICore *ic = opaque;
>      IPMIBmcExtern *ibe = opaque;

Shouldn't the above be a cast from ic?

> -    IPMIInterface *s = ibe->parent.intf;
> +    IPMIInterface *s = ic->intf;
>  
>      if (ibe->connected) {
>          if (ibe->waiting_rsp && (ibe->outlen == 0)) {
> @@ -158,7 +159,7 @@ static void extern_timeout(void *opaque)
>              ibe->inbuf[1] = ibe->outbuf[1] | 0x04;
>              ibe->inbuf[2] = ibe->outbuf[2];
>              ibe->inbuf[3] = IPMI_CC_TIMEOUT;
> -            k->handle_rsp(s, ibe->outbuf[0], ibe->inbuf + 1, 3);
> +            k->handle_msg(s, ibe->outbuf[0], ibe->inbuf + 1, 3);
>          } else {
>              continue_send(ibe);
>          }
> @@ -186,8 +187,9 @@ static void ipmi_bmc_extern_handle_command(IPMIBmc *b,
>                                         unsigned int max_cmd_len,
>                                         uint8_t msg_id)
>  {
> +    IPMICore *ic = IPMI_CORE(b);
>      IPMIBmcExtern *ibe = IPMI_BMC_EXTERN(b);
> -    IPMIInterface *s = ibe->parent.intf;
> +    IPMIInterface *s = ic->intf;
>      uint8_t err = 0, csum;
>      unsigned int i;
>  
> @@ -213,7 +215,7 @@ static void ipmi_bmc_extern_handle_command(IPMIBmc *b,
>          rsp[1] = cmd[1];
>          rsp[2] = err;
>          ibe->waiting_rsp = false;
> -        k->handle_rsp(s, msg_id, rsp, 3);
> +        k->handle_msg(s, msg_id, rsp, 3);
>          goto out;
>      }
>  
> @@ -236,7 +238,8 @@ static void ipmi_bmc_extern_handle_command(IPMIBmc *b,
>  
>  static void handle_hw_op(IPMIBmcExtern *ibe, unsigned char hw_op)
>  {
> -    IPMIInterface *s = ibe->parent.intf;
> +    IPMICore *ic = IPMI_CORE(ibe);
> +    IPMIInterface *s = ic->intf;
>      IPMIInterfaceClass *k = IPMI_INTERFACE_GET_CLASS(s);
>  
>      switch (hw_op) {
> @@ -284,7 +287,9 @@ static void handle_hw_op(IPMIBmcExtern *ibe, unsigned char hw_op)
>  
>  static void handle_msg(IPMIBmcExtern *ibe)
>  {
> -    IPMIInterfaceClass *k = IPMI_INTERFACE_GET_CLASS(ibe->parent.intf);
> +    IPMICore *ic = IPMI_CORE(ibe);
> +    IPMIInterface *s = ic->intf;
> +    IPMIInterfaceClass *k = IPMI_INTERFACE_GET_CLASS(s);
>  
>      if (ibe->in_escape) {
>          ipmi_debug("msg escape not ended\n");
> @@ -306,7 +311,7 @@ static void handle_msg(IPMIBmcExtern *ibe)
>  
>      timer_del(ibe->extern_timer);
>      ibe->waiting_rsp = false;
> -    k->handle_rsp(ibe->parent.intf, ibe->inbuf[0], ibe->inbuf + 1, ibe->inpos - 1);
> +    k->handle_msg(s, ibe->inbuf[0], ibe->inbuf + 1, ibe->inpos - 1);
>  }
>  
>  static int can_receive(void *opaque)
> @@ -382,8 +387,9 @@ static void receive(void *opaque, const uint8_t *buf, int size)
>  
>  static void chr_event(void *opaque, QEMUChrEvent event)
>  {
> +    IPMICore *ic = opaque;
>      IPMIBmcExtern *ibe = opaque;

Shouldn't the above be a cast from ic?

> -    IPMIInterface *s = ibe->parent.intf;
> +    IPMIInterface *s = ic->intf;
>      IPMIInterfaceClass *k = IPMI_INTERFACE_GET_CLASS(s);
>      unsigned char v;
>  
> @@ -398,17 +404,17 @@ static void chr_event(void *opaque, QEMUChrEvent event)
>          ibe->outlen++;
>          addchar(ibe, VM_CMD_CAPABILITIES);
>          v = VM_CAPABILITIES_IRQ | VM_CAPABILITIES_ATTN;
> -        if (k->do_hw_op(ibe->parent.intf, IPMI_POWEROFF_CHASSIS, 1) == 0) {
> +        if (k->do_hw_op(s, IPMI_POWEROFF_CHASSIS, 1) == 0) {
>              v |= VM_CAPABILITIES_POWER;
>          }
> -        if (k->do_hw_op(ibe->parent.intf, IPMI_SHUTDOWN_VIA_ACPI_OVERTEMP, 1)
> +        if (k->do_hw_op(s, IPMI_SHUTDOWN_VIA_ACPI_OVERTEMP, 1)
>              == 0) {
>              v |= VM_CAPABILITIES_GRACEFUL_SHUTDOWN;
>          }
> -        if (k->do_hw_op(ibe->parent.intf, IPMI_RESET_CHASSIS, 1) == 0) {
> +        if (k->do_hw_op(s, IPMI_RESET_CHASSIS, 1) == 0) {
>              v |= VM_CAPABILITIES_RESET;
>          }
> -        if (k->do_hw_op(ibe->parent.intf, IPMI_SEND_NMI, 1) == 0) {
> +        if (k->do_hw_op(s, IPMI_SEND_NMI, 1) == 0) {
>              v |= VM_CAPABILITIES_NMI;
>          }
>          addchar(ibe, v);
> @@ -433,7 +439,7 @@ static void chr_event(void *opaque, QEMUChrEvent event)
>              ibe->inbuf[1] = ibe->outbuf[1] | 0x04;
>              ibe->inbuf[2] = ibe->outbuf[2];
>              ibe->inbuf[3] = IPMI_CC_BMC_INIT_IN_PROGRESS;
> -            k->handle_rsp(s, ibe->outbuf[0], ibe->inbuf + 1, 3);
> +            k->handle_msg(s, ibe->outbuf[0], ibe->inbuf + 1, 3);
>          }
>          break;
>  
> @@ -475,14 +481,15 @@ static int ipmi_bmc_extern_post_migrate(void *opaque, int version_id)
>       * error on the interface if a response was being waited for.
>       */
>      if (ibe->waiting_rsp) {
> -        IPMIInterface *ii = ibe->parent.intf;
> +        IPMICore *ic = opaque;
> +        IPMIInterface *ii = ic->intf;
>          IPMIInterfaceClass *iic = IPMI_INTERFACE_GET_CLASS(ii);
>  
>          ibe->waiting_rsp = false;
>          ibe->inbuf[1] = ibe->outbuf[1] | 0x04;
>          ibe->inbuf[2] = ibe->outbuf[2];
>          ibe->inbuf[3] = IPMI_CC_BMC_INIT_IN_PROGRESS;
> -        iic->handle_rsp(ii, ibe->outbuf[0], ibe->inbuf + 1, 3);
> +        iic->handle_msg(ii, ibe->outbuf[0], ibe->inbuf + 1, 3);
>      }
>      return 0;
>  }
> diff --git a/hw/ipmi/ipmi_bmc_sim.c b/hw/ipmi/ipmi_bmc_sim.c
> index 905e091094..7cc4a22456 100644
> --- a/hw/ipmi/ipmi_bmc_sim.c
> +++ b/hw/ipmi/ipmi_bmc_sim.c
> @@ -451,7 +451,8 @@ static int attn_irq_enabled(IPMIBmcSim *ibs)
>  void ipmi_bmc_gen_event(IPMIBmc *b, uint8_t *evt, bool log)
>  {
>      IPMIBmcSim *ibs = IPMI_BMC_SIMULATOR(b);
> -    IPMIInterface *s = ibs->parent.intf;
> +    IPMICore *ic = IPMI_CORE(ibs);
> +    IPMIInterface *s = ic->intf;
>      IPMIInterfaceClass *k = IPMI_INTERFACE_GET_CLASS(s);
>  
>      if (!IPMI_BMC_EVENT_MSG_BUF_ENABLED(ibs)) {
> @@ -475,7 +476,8 @@ void ipmi_bmc_gen_event(IPMIBmc *b, uint8_t *evt, bool log)
>  static void gen_event(IPMIBmcSim *ibs, unsigned int sens_num, uint8_t deassert,
>                        uint8_t evd1, uint8_t evd2, uint8_t evd3)
>  {
> -    IPMIInterface *s = ibs->parent.intf;
> +    IPMICore *ic = IPMI_CORE(ibs);
> +    IPMIInterface *s = ic->intf;
>      IPMIInterfaceClass *k = IPMI_INTERFACE_GET_CLASS(s);
>      uint8_t evt[16];
>      IPMISensor *sens = ibs->sensors + sens_num;
> @@ -644,7 +646,8 @@ static void ipmi_sim_handle_command(IPMIBmc *b,
>                                      uint8_t msg_id)
>  {
>      IPMIBmcSim *ibs = IPMI_BMC_SIMULATOR(b);
> -    IPMIInterface *s = ibs->parent.intf;
> +    IPMICore *ic = IPMI_CORE(ibs);
> +    IPMIInterface *s = ic->intf;
>      IPMIInterfaceClass *k = IPMI_INTERFACE_GET_CLASS(s);
>      const IPMICmdHandler *hdl;
>      RspBuffer rsp = RSP_BUFFER_INITIALIZER;
> @@ -690,14 +693,15 @@ static void ipmi_sim_handle_command(IPMIBmc *b,
>      hdl->cmd_handler(ibs, cmd, cmd_len, &rsp);
>  
>   out:
> -    k->handle_rsp(s, msg_id, rsp.buffer, rsp.len);
> +    k->handle_msg(s, msg_id, rsp.buffer, rsp.len);
>  
>      next_timeout(ibs);
>  }
>  
>  static void ipmi_sim_handle_timeout(IPMIBmcSim *ibs)
>  {
> -    IPMIInterface *s = ibs->parent.intf;
> +    IPMICore *ic = IPMI_CORE(ibs);
> +    IPMIInterface *s = ic->intf;
>      IPMIInterfaceClass *k = IPMI_INTERFACE_GET_CLASS(s);
>  
>      if (!ibs->watchdog_running) {
> @@ -788,7 +792,8 @@ static void chassis_control(IPMIBmcSim *ibs,
>                              uint8_t *cmd, unsigned int cmd_len,
>                              RspBuffer *rsp)
>  {
> -    IPMIInterface *s = ibs->parent.intf;
> +    IPMICore *ic = IPMI_CORE(ibs);
> +    IPMIInterface *s = ic->intf;
>      IPMIInterfaceClass *k = IPMI_INTERFACE_GET_CLASS(s);
>  
>      switch (cmd[2] & 0xf) {
> @@ -845,7 +850,8 @@ static void get_device_id(IPMIBmcSim *ibs,
>  
>  static void set_global_enables(IPMIBmcSim *ibs, uint8_t val)
>  {
> -    IPMIInterface *s = ibs->parent.intf;
> +    IPMICore *ic = IPMI_CORE(ibs);
> +    IPMIInterface *s = ic->intf;
>      IPMIInterfaceClass *k = IPMI_INTERFACE_GET_CLASS(s);
>      bool irqs_on;
>  
> @@ -861,7 +867,8 @@ static void cold_reset(IPMIBmcSim *ibs,
>                         uint8_t *cmd, unsigned int cmd_len,
>                         RspBuffer *rsp)
>  {
> -    IPMIInterface *s = ibs->parent.intf;
> +    IPMICore *ic = IPMI_CORE(ibs);
> +    IPMIInterface *s = ic->intf;
>      IPMIInterfaceClass *k = IPMI_INTERFACE_GET_CLASS(s);
>  
>      /* Disable all interrupts */
> @@ -876,7 +883,8 @@ static void warm_reset(IPMIBmcSim *ibs,
>                         uint8_t *cmd, unsigned int cmd_len,
>                         RspBuffer *rsp)
>  {
> -    IPMIInterface *s = ibs->parent.intf;
> +    IPMICore *ic = IPMI_CORE(ibs);
> +    IPMIInterface *s = ic->intf;
>      IPMIInterfaceClass *k = IPMI_INTERFACE_GET_CLASS(s);
>  
>      if (k->reset) {
> @@ -939,7 +947,8 @@ static void clr_msg_flags(IPMIBmcSim *ibs,
>                            uint8_t *cmd, unsigned int cmd_len,
>                            RspBuffer *rsp)
>  {
> -    IPMIInterface *s = ibs->parent.intf;
> +    IPMICore *ic = IPMI_CORE(ibs);
> +    IPMIInterface *s = ic->intf;
>      IPMIInterfaceClass *k = IPMI_INTERFACE_GET_CLASS(s);
>  
>      ibs->msg_flags &= ~cmd[2];
> @@ -957,7 +966,8 @@ static void read_evt_msg_buf(IPMIBmcSim *ibs,
>                               uint8_t *cmd, unsigned int cmd_len,
>                               RspBuffer *rsp)
>  {
> -    IPMIInterface *s = ibs->parent.intf;
> +    IPMICore *ic = IPMI_CORE(ibs);
> +    IPMIInterface *s = ic->intf;
>      IPMIInterfaceClass *k = IPMI_INTERFACE_GET_CLASS(s);
>      unsigned int i;
>  
> @@ -989,7 +999,8 @@ static void get_msg(IPMIBmcSim *ibs,
>      g_free(msg);
>  
>      if (QTAILQ_EMPTY(&ibs->rcvbufs)) {
> -        IPMIInterface *s = ibs->parent.intf;
> +        IPMICore *ic = IPMI_CORE(ibs);
> +        IPMIInterface *s = ic->intf;
>          IPMIInterfaceClass *k = IPMI_INTERFACE_GET_CLASS(s);
>  
>          ibs->msg_flags &= ~IPMI_BMC_MSG_FLAG_RCV_MSG_QUEUE;
> @@ -1014,7 +1025,8 @@ static void send_msg(IPMIBmcSim *ibs,
>                       uint8_t *cmd, unsigned int cmd_len,
>                       RspBuffer *rsp)
>  {
> -    IPMIInterface *s = ibs->parent.intf;
> +    IPMICore *ic = IPMI_CORE(ibs);
> +    IPMIInterface *s = ic->intf;
>      IPMIInterfaceClass *k = IPMI_INTERFACE_GET_CLASS(s);
>      IPMIRcvBufEntry *msg;
>      uint8_t *buf;
> @@ -1130,7 +1142,8 @@ static void set_watchdog_timer(IPMIBmcSim *ibs,
>                                 uint8_t *cmd, unsigned int cmd_len,
>                                 RspBuffer *rsp)
>  {
> -    IPMIInterface *s = ibs->parent.intf;
> +    IPMICore *ic = IPMI_CORE(ibs);
> +    IPMIInterface *s = ic->intf;
>      IPMIInterfaceClass *k = IPMI_INTERFACE_GET_CLASS(s);
>      unsigned int val;
>  
> diff --git a/hw/ipmi/ipmi_bt.c b/hw/ipmi/ipmi_bt.c
> index 22f94fb98d..f76c369e4a 100644
> --- a/hw/ipmi/ipmi_bt.c
> +++ b/hw/ipmi/ipmi_bt.c
> @@ -430,7 +430,7 @@ void ipmi_bt_class_init(IPMIInterfaceClass *iic)
>  {
>      iic->init = ipmi_bt_init;
>      iic->set_atn = ipmi_bt_set_atn;
> -    iic->handle_rsp = ipmi_bt_handle_rsp;
> +    iic->handle_msg = ipmi_bt_handle_rsp;
>      iic->handle_if_event = ipmi_bt_handle_event;
>      iic->set_irq_enable = ipmi_bt_set_irq_enable;
>      iic->reset = ipmi_bt_handle_reset;
> diff --git a/hw/ipmi/ipmi_kcs.c b/hw/ipmi/ipmi_kcs.c
> index a77612946a..e0f870e13a 100644
> --- a/hw/ipmi/ipmi_kcs.c
> +++ b/hw/ipmi/ipmi_kcs.c
> @@ -417,7 +417,7 @@ void ipmi_kcs_class_init(IPMIInterfaceClass *iic)
>  {
>      iic->init = ipmi_kcs_init;
>      iic->set_atn = ipmi_kcs_set_atn;
> -    iic->handle_rsp = ipmi_kcs_handle_rsp;
> +    iic->handle_msg = ipmi_kcs_handle_rsp;
>      iic->handle_if_event = ipmi_kcs_handle_event;
>      iic->set_irq_enable = ipmi_kcs_set_irq_enable;
>  }
> diff --git a/hw/ipmi/isa_ipmi_bt.c b/hw/ipmi/isa_ipmi_bt.c
> index 02625eb94e..0f52fc4262 100644
> --- a/hw/ipmi/isa_ipmi_bt.c
> +++ b/hw/ipmi/isa_ipmi_bt.c
> @@ -74,6 +74,7 @@ static void isa_ipmi_bt_realize(DeviceState *dev, Error **errp)
>      ISAIPMIBTDevice *iib = ISA_IPMI_BT(dev);
>      IPMIInterface *ii = IPMI_INTERFACE(dev);
>      IPMIInterfaceClass *iic = IPMI_INTERFACE_GET_CLASS(ii);
> +    IPMICore *ic;
>  
>      if (!iib->bt.bmc) {
>          error_setg(errp, "IPMI device requires a bmc attribute to be set");
> @@ -82,7 +83,8 @@ static void isa_ipmi_bt_realize(DeviceState *dev, Error **errp)
>  
>      iib->uuid = ipmi_next_uuid();
>  
> -    iib->bt.bmc->intf = ii;
> +    ic = IPMI_CORE(iib->bt.bmc);
> +    ic->intf = ii;
>      iib->bt.opaque = iib;
>  
>      iic->init(ii, 0, &err);
> diff --git a/hw/ipmi/isa_ipmi_kcs.c b/hw/ipmi/isa_ipmi_kcs.c
> index 3b23ad08b3..60cab90a21 100644
> --- a/hw/ipmi/isa_ipmi_kcs.c
> +++ b/hw/ipmi/isa_ipmi_kcs.c
> @@ -73,6 +73,7 @@ static void ipmi_isa_realize(DeviceState *dev, Error **errp)
>      ISAIPMIKCSDevice *iik = ISA_IPMI_KCS(dev);
>      IPMIInterface *ii = IPMI_INTERFACE(dev);
>      IPMIInterfaceClass *iic = IPMI_INTERFACE_GET_CLASS(ii);
> +    IPMICore *ic;
>  
>      if (!iik->kcs.bmc) {
>          error_setg(errp, "IPMI device requires a bmc attribute to be set");
> @@ -81,7 +82,8 @@ static void ipmi_isa_realize(DeviceState *dev, Error **errp)
>  
>      iik->uuid = ipmi_next_uuid();
>  
> -    iik->kcs.bmc->intf = ii;
> +    ic = IPMI_CORE(iik->kcs.bmc);
> +    ic->intf = ii;
>      iik->kcs.opaque = iik;
>  
>      iic->init(ii, 0, &err);
> diff --git a/hw/ipmi/pci_ipmi_bt.c b/hw/ipmi/pci_ipmi_bt.c
> index b6e52730d3..751c15a31f 100644
> --- a/hw/ipmi/pci_ipmi_bt.c
> +++ b/hw/ipmi/pci_ipmi_bt.c
> @@ -58,6 +58,7 @@ static void pci_ipmi_bt_realize(PCIDevice *pd, Error **errp)
>      PCIIPMIBTDevice *pik = PCI_IPMI_BT(pd);
>      IPMIInterface *ii = IPMI_INTERFACE(pd);
>      IPMIInterfaceClass *iic = IPMI_INTERFACE_GET_CLASS(ii);
> +    IPMICore *ic;
>  
>      if (!pik->bt.bmc) {
>          error_setg(errp, "IPMI device requires a bmc attribute to be set");
> @@ -66,7 +67,8 @@ static void pci_ipmi_bt_realize(PCIDevice *pd, Error **errp)
>  
>      pik->uuid = ipmi_next_uuid();
>  
> -    pik->bt.bmc->intf = ii;
> +    ic = IPMI_CORE(pik->bt.bmc);
> +    ic->intf = ii;
>      pik->bt.opaque = pik;
>  
>      pci_config_set_prog_interface(pd->config, 0x02); /* BT */
> diff --git a/hw/ipmi/pci_ipmi_kcs.c b/hw/ipmi/pci_ipmi_kcs.c
> index de13418862..44a645723c 100644
> --- a/hw/ipmi/pci_ipmi_kcs.c
> +++ b/hw/ipmi/pci_ipmi_kcs.c
> @@ -58,6 +58,7 @@ static void pci_ipmi_kcs_realize(PCIDevice *pd, Error **errp)
>      PCIIPMIKCSDevice *pik = PCI_IPMI_KCS(pd);
>      IPMIInterface *ii = IPMI_INTERFACE(pd);
>      IPMIInterfaceClass *iic = IPMI_INTERFACE_GET_CLASS(ii);
> +    IPMICore *ic;
>  
>      if (!pik->kcs.bmc) {
>          error_setg(errp, "IPMI device requires a bmc attribute to be set");
> @@ -66,7 +67,8 @@ static void pci_ipmi_kcs_realize(PCIDevice *pd, Error **errp)
>  
>      pik->uuid = ipmi_next_uuid();
>  
> -    pik->kcs.bmc->intf = ii;
> +    ic = IPMI_CORE(pik->kcs.bmc);
> +    ic->intf = ii;
>      pik->kcs.opaque = pik;
>  
>      pci_config_set_prog_interface(pd->config, 0x01); /* KCS */
> diff --git a/hw/ipmi/smbus_ipmi.c b/hw/ipmi/smbus_ipmi.c
> index 1fdf0a66b6..a2383f1212 100644
> --- a/hw/ipmi/smbus_ipmi.c
> +++ b/hw/ipmi/smbus_ipmi.c
> @@ -315,6 +315,7 @@ static void smbus_ipmi_realize(DeviceState *dev, Error **errp)
>  {
>      SMBusIPMIDevice *sid = SMBUS_IPMI(dev);
>      IPMIInterface *ii = IPMI_INTERFACE(dev);
> +    IPMICore *ic;
>  
>      if (!sid->bmc) {
>          error_setg(errp, "IPMI device requires a bmc attribute to be set");
> @@ -323,7 +324,8 @@ static void smbus_ipmi_realize(DeviceState *dev, Error **errp)
>  
>      sid->uuid = ipmi_next_uuid();
>  
> -    sid->bmc->intf = ii;
> +    ic = IPMI_CORE(sid->bmc);
> +    ic->intf = ii;
>  }
>  
>  static void smbus_ipmi_init(Object *obj)
> @@ -359,7 +361,7 @@ static void smbus_ipmi_class_init(ObjectClass *oc, void *data)
>      dc->vmsd = &vmstate_smbus_ipmi;
>      dc->realize = smbus_ipmi_realize;
>      iic->set_atn = smbus_ipmi_set_atn;
> -    iic->handle_rsp = smbus_ipmi_handle_rsp;
> +    iic->handle_msg = smbus_ipmi_handle_rsp;
>      iic->handle_if_event = smbus_ipmi_handle_event;
>      iic->set_irq_enable = smbus_ipmi_set_irq_enable;
>      iic->get_fwinfo = smbus_ipmi_get_fwinfo;
> diff --git a/include/hw/ipmi/ipmi.h b/include/hw/ipmi/ipmi.h
> index 77a7213ed9..1fa8cd12e5 100644
> --- a/include/hw/ipmi/ipmi.h
> +++ b/include/hw/ipmi/ipmi.h
> @@ -111,11 +111,11 @@ uint32_t ipmi_next_uuid(void);
>  #define TYPE_IPMI_INTERFACE "ipmi-interface"
>  #define IPMI_INTERFACE(obj) \
>       INTERFACE_CHECK(IPMIInterface, (obj), TYPE_IPMI_INTERFACE)
> +typedef struct IPMIInterface IPMIInterface;
>  typedef struct IPMIInterfaceClass IPMIInterfaceClass;
>  DECLARE_CLASS_CHECKERS(IPMIInterfaceClass, IPMI_INTERFACE,
>                         TYPE_IPMI_INTERFACE)
> -
> -typedef struct IPMIInterface IPMIInterface;
> +struct IPMICore;
>  
>  struct IPMIInterfaceClass {
>      InterfaceClass parent;
> @@ -156,9 +156,9 @@ struct IPMIInterfaceClass {
>      void (*reset)(struct IPMIInterface *s, bool is_cold);
>  
>      /*
> -     * Handle a response from the bmc.
> +     * Handle an IPMI message.

Could you add a little more explaination here.  Like:

Handle an IPMI message from the remote side.  This is either a message
from the BMC being handled by an IPMI interface on the host side, or a
message from the host side being handled by a BMC emulator running in
this VM.

>       */
> -    void (*handle_rsp)(struct IPMIInterface *s, uint8_t msg_id,
> +    void (*handle_msg)(struct IPMIInterface *s, uint8_t msg_id,
>                         unsigned char *rsp, unsigned int rsp_len);
>  
>      /*
> @@ -166,12 +166,38 @@ struct IPMIInterfaceClass {
>       */
>      void *(*get_backend_data)(struct IPMIInterface *s);
>  
> +    /*
> +     * Set the IPMI core.
> +     */
> +    void (*set_ipmi_handler)(struct IPMIInterface *s, struct IPMICore *ic);
> +
>      /*
>       * Return the firmware info for a device.
>       */
>      void (*get_fwinfo)(struct IPMIInterface *s, IPMIFwInfo *info);
>  };
>  
> +/*
> + * Define an IPMI core (Either BMC or Host simulator.)
> + */
> +#define TYPE_IPMI_CORE "ipmi-core"
> +OBJECT_DECLARE_TYPE(IPMICore, IPMICoreClass, IPMI_CORE)
> +
> +struct IPMICore {
> +    DeviceState parent;
> +
> +    IPMIInterface *intf;
> +};
> +
> +struct IPMICoreClass {
> +    DeviceClass parent;
> +
> +    /*
> +     * Handle a hardware command.
> +     */
> +    void (*handle_hw_op)(struct IPMICore *s, uint8_t hw_op, uint8_t operand);
> +};
> +
>  /*
>   * Define a BMC simulator (or perhaps a connection to a real BMC)
>   */
> @@ -180,15 +206,13 @@ OBJECT_DECLARE_TYPE(IPMIBmc, IPMIBmcClass,
>                      IPMI_BMC)
>  
>  struct IPMIBmc {
> -    DeviceState parent;
> +    IPMICore parent;
>  
>      uint8_t slave_addr;
> -
> -    IPMIInterface *intf;
>  };
>  
>  struct IPMIBmcClass {
> -    DeviceClass parent;
> +    IPMICoreClass parent;
>  
>      /* Called when the system resets to report to the bmc. */
>      void (*handle_reset)(struct IPMIBmc *s);
> -- 
> 2.33.0.309.g3052b89438-goog
> 

