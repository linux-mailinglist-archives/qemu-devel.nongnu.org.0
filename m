Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 451AF69050B
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 11:38:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ4J5-00027n-QA; Thu, 09 Feb 2023 05:37:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pQ4J3-00027I-Mi
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 05:37:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pQ4J1-0001K4-Kl
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 05:37:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675939050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q/z6V6/GgHBEnnUe/vEutixKORWAHigHqqLRxixDZnI=;
 b=T7tEGWQLoR6fU89Ucm1z3D26xlloYUyhApewswXWFWPLgzeLnCAt9eFXWws5svnjJLxYIe
 zxs3OmadEYIIn7u6NZTVeD12Fqbydl5G7XsbOZ4KqRnCIxrIXADORo5+xYWZvRlyd3O2IC
 RUb7QbA8hDC1utdbz8DtvKUO9pOiNxU=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-42-Wp8n-GPKORyxhbgfOqpAGg-1; Thu, 09 Feb 2023 05:37:28 -0500
X-MC-Unique: Wp8n-GPKORyxhbgfOqpAGg-1
Received: by mail-qk1-f198.google.com with SMTP id
 bp30-20020a05620a459e00b00738e1fe2470so933091qkb.23
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 02:37:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q/z6V6/GgHBEnnUe/vEutixKORWAHigHqqLRxixDZnI=;
 b=4QRl8vQboRY3A2tX9dKn9G9GsPNAn4KXNzJ8QTlkhSZSKTwZzQl/cBauq8H2YZmSzt
 Iy6YTfSJoL0zr7CqboqR9wItR441ax2gupE59nIAyyzNAZiRz6NlOKg3hwz9usxSIz/i
 ScS33q+tRllGPHHyesKQiwG+coi0DM7EGxtcGFza1MUv5yj9xXqRdLvJPueYAhDmBIY4
 TpCClmY2VShhHv8NufC1DuztQyipb4Rg88RFu/iWJzogQ6DjPXtasF+6ujHVbrHeU+iC
 gSSflD/GscXNMS2Hu98QRnQVMJ0OrzYGDCLKpV++W9kKgdYmg5CR4fHQusOYJ9FRBIVE
 VWNQ==
X-Gm-Message-State: AO0yUKVjQQxCJoZjRTaXZ35bgOnTRN/6uK8VhTuXQ46rGKtS0qRJv5ae
 97cwCMH/oiMVAf5aTFHxYulLZ7Dtu4pNj8w0cpiEX74sl/y03Jk4CdlPfJHE1QMFFYd9Ip9KORF
 IkCktOiFnwY2aspE=
X-Received: by 2002:ac8:5f0d:0:b0:3b8:4cba:e26e with SMTP id
 x13-20020ac85f0d000000b003b84cbae26emr19313661qta.51.1675939048314; 
 Thu, 09 Feb 2023 02:37:28 -0800 (PST)
X-Google-Smtp-Source: AK7set//X+BztfJPqhGvM5F0GfUSfrgKPkdw0Fy2znBY6T/Roa3bE43bDpNriJykIMZBXpCADlhSGg==
X-Received: by 2002:ac8:5f0d:0:b0:3b8:4cba:e26e with SMTP id
 x13-20020ac85f0d000000b003b84cbae26emr19313642qta.51.1675939048019; 
 Thu, 09 Feb 2023 02:37:28 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-209.web.vodafone.de.
 [109.43.176.209]) by smtp.gmail.com with ESMTPSA id
 d19-20020ae9ef13000000b0071ddbe8fe23sm1092443qkg.24.2023.02.09.02.37.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 02:37:27 -0800 (PST)
Message-ID: <5fbc69eb-c5a3-3f0e-265b-3bbbbc0cfc4e@redhat.com>
Date: Thu, 9 Feb 2023 11:37:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>, qemu-devel@nongnu.org
Cc: ysato@users.sourceforge.jp, alex.bennee@linaro.org, pbonzini@redhat.com,
 fam@euphon.net, peter.maydell@linaro.org, philmd@linaro.org,
 kwolf@redhat.com, hreitz@redhat.com
References: <d1500fe9389a1f6964a2b132466d5be2a44d205f.1675858906.git.kkamran.bese16seecs@seecs.edu.pk>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] Updated the FSF address to <https://www.gnu.org/licenses/>
In-Reply-To: <d1500fe9389a1f6964a2b132466d5be2a44d205f.1675858906.git.kkamran.bese16seecs@seecs.edu.pk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.146, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


  Hi Khadija,

the diffs below look fine now ... but unfortunately the commit description 
is now lacking your "Signed-off-by" line as we require it for QEMU:

 
https://www.qemu.org/docs/master/devel/submitting-a-patch.html#patch-emails-must-include-a-signed-off-by-line

You can edit the commit description easily by running "git commit --amend" 
again in the branch where you have your commit (assuming it is the topmost 
one), or by running "git rebase -i master" and then mark the commit with 
"reword" instead of "pick".

While you're at it, it would also be nice to re-add the description and the 
"Resolves:" line that you had in earlier version of the patches.

  HTH,
   Thomas


On 08/02/2023 13.51, Khadija Kamran wrote:
> diff --git a/contrib/gitdm/filetypes.txt b/contrib/gitdm/filetypes.txt
> index d2d6f6db8d..b1d01c0992 100644
> --- a/contrib/gitdm/filetypes.txt
> +++ b/contrib/gitdm/filetypes.txt
> @@ -12,8 +12,7 @@
>   # GNU Library General Public License for more details.
>   #
>   # You should have received a copy of the GNU General Public License
> -# along with this program; if not, write to the Free Software
> -# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
> +# along with this program. If not, see <https://www.gnu.org/licenses/>.
>   #
>   # Authors : Gregorio Robles <grex@gsyc.escet.urjc.es>
>   # Authors : Germán Póo-Caamaño <gpoo@gnome.org>
> diff --git a/hw/scsi/viosrp.h b/hw/scsi/viosrp.h
> index e5f9768e8f..58c29aa925 100644
> --- a/hw/scsi/viosrp.h
> +++ b/hw/scsi/viosrp.h
> @@ -16,8 +16,7 @@
>   /* GNU General Public License for more details.                              */
>   /*                                                                           */
>   /* You should have received a copy of the GNU General Public License         */
> -/* along with this program; if not, write to the Free Software               */
> -/* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA */
> +/* along with this program. If not, see <https://www.gnu.org/licenses/>.     */
>   /*                                                                           */
>   /*                                                                           */
>   /* This file contains structures and definitions for IBM RPA (RS/6000        */
> diff --git a/hw/sh4/sh7750_regs.h b/hw/sh4/sh7750_regs.h
> index beb571d5e9..94043431e6 100644
> --- a/hw/sh4/sh7750_regs.h
> +++ b/hw/sh4/sh7750_regs.h
> @@ -22,8 +22,7 @@
>    * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
>    * General Public License for more details. You should have received
>    * a copy of the GNU General Public License along with RTEMS; see
> - * file COPYING. If not, write to the Free Software Foundation, 675
> - * Mass Ave, Cambridge, MA 02139, USA.
> + * file COPYING. If not, see <https://www.gnu.org/licenses/>.
>    *
>    * As a special exception, including RTEMS header files in a file,
>    * instantiating RTEMS generics or templates, or linking other files
> diff --git a/include/hw/arm/raspi_platform.h b/include/hw/arm/raspi_platform.h
> index e0e6c8ce94..4a56dd4b89 100644
> --- a/include/hw/arm/raspi_platform.h
> +++ b/include/hw/arm/raspi_platform.h
> @@ -18,8 +18,7 @@
>    * GNU General Public License for more details.
>    *
>    * You should have received a copy of the GNU General Public License
> - * along with this program; if not, write to the Free Software
> - * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
> + * along with this program. If not, see <https://www.gnu.org/licenses/>.
>    *
>    * Various undocumented addresses and names come from Herman Hermitage's VC4
>    * documentation:
> diff --git a/include/qemu/uri.h b/include/qemu/uri.h
> index d201c61260..cf8ec70356 100644
> --- a/include/qemu/uri.h
> +++ b/include/qemu/uri.h
> @@ -41,8 +41,7 @@
>    * Lesser General Public License for more details.
>    *
>    * You should have received a copy of the GNU Lesser General Public
> - * License along with this library; if not, write to the Free Software
> - * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307  USA
> + * License along with this library. If not, see <https://www.gnu.org/licenses/>.
>    *
>    * Authors:
>    *    Richard W.M. Jones <rjones@redhat.com>
> diff --git a/tests/qemu-iotests/022 b/tests/qemu-iotests/022
> index a116cfe255..d98d1ea90f 100755
> --- a/tests/qemu-iotests/022
> +++ b/tests/qemu-iotests/022
> @@ -16,9 +16,7 @@
>   # GNU General Public License for more details.
>   #
>   # You should have received a copy of the GNU General Public License
> -# along with this program; if not, write to the Free Software
> -# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307
> -# USA
> +# along with this program. If not, see <https://www.gnu.org/licenses/>.
>   #
>   
>   # creator
> diff --git a/tests/unit/rcutorture.c b/tests/unit/rcutorture.c
> index 495a4e6f42..7662081683 100644
> --- a/tests/unit/rcutorture.c
> +++ b/tests/unit/rcutorture.c
> @@ -50,8 +50,7 @@
>    * GNU General Public License for more details.
>    *
>    * You should have received a copy of the GNU General Public License
> - * along with this program; if not, write to the Free Software
> - * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
> + * along with this program. If not, see <https://www.gnu.org/licenses/>.
>    *
>    * Copyright (c) 2008 Paul E. McKenney, IBM Corporation.
>    */
> diff --git a/tests/unit/test-rcu-list.c b/tests/unit/test-rcu-list.c
> index 64b81ae058..9964171da4 100644
> --- a/tests/unit/test-rcu-list.c
> +++ b/tests/unit/test-rcu-list.c
> @@ -14,8 +14,7 @@
>    * GNU General Public License for more details.
>    *
>    * You should have received a copy of the GNU General Public License
> - * along with this program; if not, write to the Free Software
> - * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
> + * along with this program. If not, see <https://www.gnu.org/licenses/>.
>    *
>    * Copyright (c) 2013 Mike D. Day, IBM Corporation.
>    */
> diff --git a/util/uri.c b/util/uri.c
> index ff72c6005f..dcb3305236 100644
> --- a/util/uri.c
> +++ b/util/uri.c
> @@ -43,8 +43,7 @@
>    * Lesser General Public License for more details.
>    *
>    * You should have received a copy of the GNU Lesser General Public
> - * License along with this library; if not, write to the Free Software
> - * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307  USA
> + * License along with this library. If not, see <https://www.gnu.org/licenses/>.
>    *
>    * Authors:
>    *    Richard W.M. Jones <rjones@redhat.com>


