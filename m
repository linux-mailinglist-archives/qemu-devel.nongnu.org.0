Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 551D63F1F55
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 19:46:05 +0200 (CEST)
Received: from localhost ([::1]:34756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGm7A-0002ok-CV
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 13:46:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1mGm1G-0003iG-4F
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 13:39:58 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:34362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1mGm18-00010v-H8
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 13:39:57 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 gz13-20020a17090b0ecdb0290178c0e0ce8bso7645912pjb.1
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 10:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=9H1tvnadPOE3ZsVFX3l0X96lrMuTkp945GJK/1OZbEY=;
 b=UmbE9a8pHb8jItBVEMb9It5w49PRoPuwtJZ4dyMWBbvPfVI4Te/EP74w34C/xAdFNC
 6ifmdTXdwxw7xoc0HSGGoe/zvNwF+uT97JHQtUYEzSWIPczu/Tqnb9tJksXXc1nm+KrL
 V8qiunKH7FQR69l72+gjyImbJw86s1KgD+tIL6LKGWe0Msz11uu2nBKaiCboWrTwOJ7e
 ywqwi+AzONvaNDDsnx7lmd09o9ckacrLnHOasfuK3tvU/CYTyxj72sUex/f8uU7Cm2lp
 MrK8UmNSjMR1uRIP9nbImsM2ph80xbPXi9nRq7SbBSU32N89kbGL3CbcX6iml1qFAsXp
 aofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=9H1tvnadPOE3ZsVFX3l0X96lrMuTkp945GJK/1OZbEY=;
 b=ME+UCyne07Q4Vvy5KtHPDyVP/YZz8XSsStVOno3gfusuf1QYBnwYYp3dmyMeP4DjdY
 1qRFMZ0IdowXQC1QwTiZ3dHs6T50C7HYLtKhJlCQ8GNL3HcmmQAaPSvwQa1KcYb+i4//
 Yg9HJrZTIADDXL8w60cB9tTEC+YyiGjzq3j8EVFOytxJ54NbrhCR2uxjkeWF/FvVRRR8
 7Vj3AUqZMUUoN18ovEiF77IQURHVFAzwUgTnH6CI73u+8uLVXMBGM54jPV/GtSotafmx
 ppdec7S52Nx2uxnYZ7BFk77Rxz83oqjhjIqsSs0d/NJmVlepcX/ZOVTXc/Y+Hl2QpLa7
 n7LQ==
X-Gm-Message-State: AOAM5335Z/L0qUGK8U2CVfEZSOP1HitV3KxTwjlSRQlATML2OLBu2v+V
 tzSwYlsLjQrCf9Kksxs6xD9MKcD86A8=
X-Google-Smtp-Source: ABdhPJxbUlwtslofLF1Tacxt9Ju58jyQqKzA02ZRso3WYNE58xUCrQSVIjD6TguAIgxhJW96GcxUIQ==
X-Received: by 2002:a17:90a:a01:: with SMTP id
 o1mr15824838pjo.115.1629394788983; 
 Thu, 19 Aug 2021 10:39:48 -0700 (PDT)
Received: from localhost.localdomain ([120.138.12.8])
 by smtp.gmail.com with ESMTPSA id s2sm4061090pfw.193.2021.08.19.10.39.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 10:39:48 -0700 (PDT)
From: G S Niteesh Babu <niteesh.gs@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 7/7] python/aqmp-tui: Add QMP connection manager
Date: Thu, 19 Aug 2021 23:08:31 +0530
Message-Id: <20210819173831.23515-8-niteesh.gs@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210819173831.23515-1-niteesh.gs@gmail.com>
References: <20210819173831.23515-1-niteesh.gs@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=niteesh.gs@gmail.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: ehabkost@redhat.com, kchamart@redhat.com, jsnow@redhat.com,
 armbru@redhat.com, wainersm@redhat.com,
 G S Niteesh Babu <niteesh.gs@gmail.com>, stefanha@redhat.com, crosa@redhat.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The connection manager will take care of connecting/disconnecting
to the server. This will also try to reconnect to the server in
certain situations where the client has been disconnected due to
some error condition.

Signed-off-by: G S Niteesh Babu <niteesh.gs@gmail.com>
---
 python/qemu/aqmp/aqmp_tui.py | 127 +++++++++++++++++++++++++++++------
 1 file changed, 105 insertions(+), 22 deletions(-)

diff --git a/python/qemu/aqmp/aqmp_tui.py b/python/qemu/aqmp/aqmp_tui.py
index 03d4808acd..c47abe0a25 100644
--- a/python/qemu/aqmp/aqmp_tui.py
+++ b/python/qemu/aqmp/aqmp_tui.py
@@ -35,8 +35,9 @@
 import urwid_readline
 
 from ..qmp import QEMUMonitorProtocol, QMPBadPortError
+from .error import ProtocolError
 from .message import DeserializationError, Message, UnexpectedTypeError
-from .protocol import ConnectError
+from .protocol import ConnectError, Runstate
 from .qmp_client import ExecInterruptedError, QMPClient
 from .util import create_task, pretty_traceback
 
@@ -128,17 +129,26 @@ class App(QMPClient):
 
     Initializes the widgets and starts the urwid event loop.
     """
-    def __init__(self, address: Union[str, Tuple[str, int]]) -> None:
+    def __init__(self, address: Union[str, Tuple[str, int]], num_retries: int,
+                 retry_delay: Optional[int]) -> None:
         """
         Initializes the TUI.
 
         :param address:
             Address of the server to connect to.
+        :param num_retries:
+            The number of times to retry before stopping to reconnect.
+        :param retry_delay:
+            The delay(sec) before each retry
         """
         urwid.register_signal(type(self), UPDATE_MSG)
         self.window = Window(self)
         self.address = address
         self.aloop: Optional[asyncio.AbstractEventLoop] = None
+        self.num_retries = num_retries
+        self.retry_delay = retry_delay if retry_delay else 2
+        self.retry: bool = False
+        self.disconnecting: bool = False
         super().__init__()
 
     def add_to_history(self, msg: str, level: Optional[str] = None) -> None:
@@ -212,10 +222,10 @@ def handle_event(self, event: Message) -> None:
         """
         try:
             await self._raw(msg, assign_id='id' not in msg)
-        except ExecInterruptedError:
-            logging.info('Error server disconnected before reply')
+        except ExecInterruptedError as err:
+            logging.info('Error server disconnected before reply %s', str(err))
             self.add_to_history('Server disconnected before reply', 'ERROR')
-            self._set_status("[Server Disconnected]")
+            await self.disconnect()
         except Exception as err:
             logging.error('Exception from _send_to_server: %s', str(err))
             raise err
@@ -237,10 +247,10 @@ def cb_send_to_server(self, raw_msg: str) -> None:
             create_task(self._send_to_server(msg))
         except (ValueError, TypeError) as err:
             logging.info('Invalid message: %s', str(err))
-            self.add_to_history(f'{raw_msg}: {err}')
+            self.add_to_history(f'{raw_msg}: {err}', 'ERROR')
         except (DeserializationError, UnexpectedTypeError) as err:
             logging.info('Invalid message: %s', err.error_message)
-            self.add_to_history(f'{raw_msg}: {err.error_message}')
+            self.add_to_history(f'{raw_msg}: {err.error_message}', 'ERROR')
 
     def unhandled_input(self, key: str) -> None:
         """
@@ -266,18 +276,32 @@ def kill_app(self) -> None:
 
         :raise Exception: When an unhandled exception is caught.
         """
-        # It is ok to call disconnect even in disconnect state
+        await self.disconnect()
+        logging.debug('Disconnect finished. Exiting app')
+        raise urwid.ExitMainLoop()
+
+    async def disconnect(self) -> None:
+        """
+        Overrides the disconnect method to handle the errors locally.
+        """
+        if self.disconnecting:
+            return
         try:
-            await self.disconnect()
-            logging.debug('Disconnect finished. Exiting app')
-        except EOFError:
-            # We receive an EOF during disconnect, ignore that
-            pass
+            self.disconnecting = True
+            await super().disconnect()
+            self.retry = False
+        except EOFError as err:
+            logging.info('disconnect: %s', str(err))
+            self.retry = True
+        except ProtocolError as err:
+            logging.info('disconnect: %s', str(err))
+            self.retry = False
         except Exception as err:
-            logging.info('_kill_app: %s', str(err))
-            # Let the app crash after providing a proper stack trace
+            logging.error('disconnect: Unhandled exception %s', str(err))
+            self.retry = False
             raise err
-        raise urwid.ExitMainLoop()
+        finally:
+            self.disconnecting = False
 
     def _set_status(self, msg: str) -> None:
         """
@@ -301,18 +325,72 @@ def _get_formatted_address(self) -> str:
             addr = f'{self.address}'
         return addr
 
-    async def connect_server(self) -> None:
+    async def _initiate_connection(self) -> Optional[ConnectError]:
+        """
+        Tries connecting to a server a number of times with a delay between
+        each try. If all retries failed then return the error faced during
+        the last retry.
+
+        :return: Error faced during last retry.
+        """
+        current_retries = 0
+        err = None
+
+        # initial try
+        await self.connect_server()
+        while self.retry and current_retries < self.num_retries:
+            logging.info('Connection Failed, retrying in %d', self.retry_delay)
+            status = f'[Retry #{current_retries} ({self.retry_delay}s)]'
+            self._set_status(status)
+
+            await asyncio.sleep(self.retry_delay)
+
+            err = await self.connect_server()
+            current_retries += 1
+        # If all retries failed report the last error
+        if err:
+            logging.info('All retries failed: %s', err)
+            return err
+        return None
+
+    async def manage_connection(self) -> None:
+        """
+        Manage the connection based on the current run state.
+
+        A reconnect is issued when the current state is IDLE and the number
+        of retries is not exhausted.
+        A disconnect is issued when the current state is DISCONNECTING.
+        """
+        while True:
+            if self.runstate == Runstate.IDLE:
+                err = await self._initiate_connection()
+                # If retry is still true then, we have exhausted all our tries.
+                if err:
+                    self._set_status(f'[Error: {err.error_message}]')
+                else:
+                    addr = self._get_formatted_address()
+                    self._set_status(f'[Connected {addr}]')
+            elif self.runstate == Runstate.DISCONNECTING:
+                self._set_status('[Disconnected]')
+                await self.disconnect()
+                # check if a retry is needed
+                if self.runstate == Runstate.IDLE:
+                    continue
+            await self.runstate_changed()
+
+    async def connect_server(self) -> Optional[ConnectError]:
         """
         Initiates a connection to the server at address `self.address`
         and in case of a failure, sets the status to the respective error.
         """
         try:
             await self.connect(self.address)
-            addr = self._get_formatted_address()
-            self._set_status(f'Connected to {addr}')
+            self.retry = False
         except ConnectError as err:
             logging.info('connect_server: ConnectError %s', str(err))
-            self._set_status(f'[ConnectError: {err.error_message}]')
+            self.retry = True
+            return err
+        return None
 
     def run(self, debug: bool = False) -> None:
         """
@@ -341,7 +419,7 @@ def run(self, debug: bool = False) -> None:
                                    event_loop=event_loop)
 
         create_task(self.wait_for_events(), self.aloop)
-        create_task(self.connect_server(), self.aloop)
+        create_task(self.manage_connection(), self.aloop)
         try:
             main_loop.run()
         except Exception as err:
@@ -566,6 +644,11 @@ def main() -> None:
     parser = argparse.ArgumentParser(description='AQMP TUI')
     parser.add_argument('qmp_server', help='Address of the QMP server. '
                         'Format <UNIX socket path | TCP addr:port>')
+    parser.add_argument('--num-retries', type=int, default=10,
+                        help='Number of times to reconnect before giving up.')
+    parser.add_argument('--retry-delay', type=int,
+                        help='Time(s) to wait before next retry. '
+                        'Default action is to wait 2s between each retry.')
     parser.add_argument('--log-file', help='The Log file name')
     parser.add_argument('--log-level', default='WARNING',
                         help='Log level <CRITICAL|ERROR|WARNING|INFO|DEBUG|>')
@@ -581,7 +664,7 @@ def main() -> None:
     except QMPBadPortError as err:
         parser.error(str(err))
 
-    app = App(address)
+    app = App(address, args.num_retries, args.retry_delay)
 
     root_logger = logging.getLogger()
     root_logger.setLevel(logging.getLevelName(args.log_level))
-- 
2.17.1


